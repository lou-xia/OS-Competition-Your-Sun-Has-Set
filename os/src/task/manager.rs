use core::sync::atomic::{AtomicBool, Ordering};

use super::{ProcessControlBlock, TaskContext, TaskControlBlock, TaskStatus};
use crate::{sync::{TicketGuard, TicketLock, UPIntrFreeCell}, vdso::vdso::{LockedHeapAllocator, VDSO_DATA, VDSO_HEAP_ALLOCATOR}};
use alloc::{collections::{btree_map::BTreeMap, vec_deque::VecDeque}, sync::Arc, vec::Vec};
use lazy_static::*;

#[derive(Debug)]
pub struct TaskManager {
    ready_heap: Vec<Arc<TaskSched, LockedHeapAllocator>, LockedHeapAllocator>, // 就绪任务堆, 大根堆
}

#[derive(Debug)]
pub struct KernelTaskManager {
    ready_queue: VecDeque<Arc<TaskSched, LockedHeapAllocator>>, // 就绪任务队列, FIFO
}

#[derive(Debug)]
pub struct TaskSched {
    pub id: (usize, usize), // 任务ID(同时是线程id)
    pub can_user_sched: AtomicBool, // 用户是否可以调度
    pub inner: TicketLock<TaskSchedInner>,
}

#[derive(Debug)]
pub struct TaskSchedInner {
    pub prio: usize, // 静态优先级
    pub aging: usize, // 老化机制, 用于防止饥饿
    pub task_cx: TaskContext,
    pub task_status: TaskStatus,
}

impl TaskSched {
    pub fn new(pid: usize, tid: usize, prio: usize, task_cx: TaskContext, task_status: TaskStatus) -> Self {
        Self {
            id: (pid, tid),
            can_user_sched: AtomicBool::new(true), // 默认用户不可调度
            inner:
                TicketLock::new(TaskSchedInner {
                    prio,
                    aging: 0,
                    task_cx,
                    task_status,
                })
            ,
        }
    }

    #[inline]
    pub fn inner_exclusive_access(&self) -> TicketGuard<'_, TaskSchedInner> {
        self.inner.lock()
    }

    #[inline]
    pub fn inner_exclusive_session<F, R>(&self, f: F) -> R
    where
        F: FnOnce(&mut TaskSchedInner) -> R,
    {
        let mut inner = self.inner.lock();
        f(&mut inner)
    }

    #[inline]
    pub fn get_dynamic_prio(&self) -> usize {
        let inner = self.inner_exclusive_access();
        inner.prio + inner.aging
    }
}

impl PartialEq for TaskSched {
    fn eq(&self, other: &Self) -> bool {
        (self.get_dynamic_prio() == other.get_dynamic_prio()) && (self.id == other.id)
    }
}

impl PartialOrd for TaskSched {
    // 大根堆, 优先级高的任务在前
    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
        let p1 = self.get_dynamic_prio();
        let p2 = other.get_dynamic_prio();
        Some(
            if p1 == p2 {
                self.id.cmp(&other.id)
            } else {
                p1.cmp(&p2)
            }
        )
    }
}

impl Eq for TaskSched {}

impl Ord for TaskSched {
    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
        self.partial_cmp(other).unwrap_or(core::cmp::Ordering::Equal)
    }
}

impl TaskManager {
    pub fn new() -> Self {
        Self {
            ready_heap: Vec::with_capacity_in(1 << 7, *VDSO_HEAP_ALLOCATOR),
        }
    }

    #[inline(always)]
    fn len(&self) -> usize {
        self.ready_heap.len()
    }

    // 关键: 不能使用core, 只能使用builtin
    pub fn add(&mut self, task: Arc<TaskSched, LockedHeapAllocator>) {
        // 插入任务到堆中
        self.ready_heap.push(task);
        // 进行上滤操作
        let mut index = self.len() - 1;
        while index > 0 {
            let parent_index = (index - 1) / 2;
            if self.ready_heap[index] > self.ready_heap[parent_index] {
                // 交换, 内联函数
                self.ready_heap.swap(index, parent_index);
                index = parent_index;
            } else {
                break;
            }
        }
    }

    pub fn fetch(&mut self) -> Option<Arc<TaskSched, LockedHeapAllocator>> {
        if self.len() == 0 {
            return None; // 没有任务可调度
        } else if self.len() == 1 {
            return self.ready_heap.pop(); // 只有一个任务, 直接弹出
        }
        // 取出堆顶任务,同时将最后一个任务放到堆顶
        let task = self.ready_heap.swap_remove(0);
        task.inner_exclusive_access().aging = 0; // 重置老化

        // 老化
        for i in 0..self.len() {
            let mut inner = self.ready_heap[i].inner_exclusive_access();
            inner.aging += 1;
        }
        // 下滤操作
        let mut index = 0;
        while index < self.len() {
            let left_child = 2 * index + 1;
            let right_child = 2 * index + 2;
            let mut largest = index;

            if left_child < self.len() && self.ready_heap[left_child] > self.ready_heap[largest] {
                largest = left_child;
            }
            if right_child < self.len() && self.ready_heap[right_child] > self.ready_heap[largest] {
                largest = right_child;
            }
            if largest != index {
                // 交换, 内联函数
                self.ready_heap.swap(index, largest);
                index = largest;
            } else {
                break;
            }
        }
        Some(task)

    }

    fn peek(&self) -> Option<&Arc<TaskSched, LockedHeapAllocator>> {
        self.ready_heap.get(0)
    }

    fn add_aging_all(&mut self) {
        for task in self.ready_heap.iter() {
            let mut inner = task.inner_exclusive_access();
            inner.aging += 1;
        }
    }
}

impl KernelTaskManager {
    pub fn new() -> Self {
        Self {
            ready_queue: VecDeque::new(),
        }
    }

    pub fn add(&mut self, task: Arc<TaskSched, LockedHeapAllocator>) {
        self.ready_queue.push_back(task);
    }

    pub fn fetch(&mut self) -> Option<Arc<TaskSched, LockedHeapAllocator>> {
        self.ready_queue.pop_front()
    }

    #[inline(always)]
    #[allow(unused)]
    fn len(&self) -> usize {
        self.ready_queue.len()
    }

    fn peek(&self) -> Option<&Arc<TaskSched, LockedHeapAllocator>> {
        self.ready_queue.front()
    }

    fn add_aging_all(&mut self) {
        for task in self.ready_queue.iter() {
            let mut inner = task.inner_exclusive_access();
            inner.aging += 1;
        }
    }
}

lazy_static! {
    pub static ref PID2PCB: UPIntrFreeCell<BTreeMap<usize, Arc<ProcessControlBlock>>> =
        unsafe { UPIntrFreeCell::new(BTreeMap::new()) };
    pub static ref KERNEL_TASK_MANAGER: UPIntrFreeCell<KernelTaskManager> =
        unsafe { UPIntrFreeCell::new(KernelTaskManager::new()) };
}

pub fn add_task(task: Arc<TaskSched, LockedHeapAllocator>) {
    if task.can_user_sched.load(Ordering::SeqCst) {
        // 用户可调度的任务
        VDSO_DATA.exclusive_access().task_manager.add(task);
    } else {
        // 内核任务, 直接添加到内核任务管理器
        KERNEL_TASK_MANAGER.exclusive_access().add(task);
    }
    // KERNEL_TASK_MANAGER.exclusive_access().add(task);
}

pub fn wakeup_task(task: Arc<TaskControlBlock>) {
    let mut task_inner = task.sched.inner_exclusive_access();
    task_inner.task_status = TaskStatus::Ready;
    drop(task_inner);
    add_task(task.sched.clone());
}

pub fn fetch_task() -> Option<Arc<TaskSched, LockedHeapAllocator>> {
    let mut kernel_inner = KERNEL_TASK_MANAGER.exclusive_access();
    let mut vdso_inner = VDSO_DATA.exclusive_access();
    if kernel_inner.len() > 0 {
        if vdso_inner.task_manager.len() > 0 {
            let kernel_peek = kernel_inner.peek().unwrap();
            let vdso_peek = vdso_inner.task_manager.peek().unwrap();
            if kernel_peek.get_dynamic_prio() + 5 >= vdso_peek.get_dynamic_prio() {
                // 内核任务优先级更高, 选择内核任务
                vdso_inner.task_manager.add_aging_all();
                kernel_inner.fetch()
            } else {
                // 用户任务优先级更高, 选择用户任务
                kernel_inner.add_aging_all();
                vdso_inner.task_manager.fetch()
            }
        } else {
            kernel_inner.fetch()
        }
    } else {
        vdso_inner.task_manager.fetch()
    }
}

pub fn pid2process(pid: usize) -> Option<Arc<ProcessControlBlock>> {
    let map = PID2PCB.exclusive_access();
    map.get(&pid).map(Arc::clone)
}

pub fn insert_into_pid2process(pid: usize, process: Arc<ProcessControlBlock>) {
    PID2PCB.exclusive_access().insert(pid, process);
}

pub fn remove_from_pid2process(pid: usize) {
    let mut map = PID2PCB.exclusive_access();
    if map.remove(&pid).is_none() {
        panic!("cannot find pid {} in pid2task!", pid);
    }
}
