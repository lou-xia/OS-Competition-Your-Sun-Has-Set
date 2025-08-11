use super::{ProcessControlBlock, TaskContext, TaskControlBlock, TaskStatus};
use crate::{sync::{TicketGuard, TicketLock, UPIntrFreeCell}, vdso::vdso::{LockedHeapAllocator, VDSO_DATA, VDSO_HEAP_ALLOCATOR}};
use alloc::{collections::btree_map::BTreeMap, sync::Arc};
use lazy_static::*;

#[derive(Debug)]
pub struct TaskManager {
    // ready_queue: VecDeque<Task>,
    // ready_queue: BTreeSet<Arc<TaskSched>>,
    ready_heap: [Arc<TaskSched, LockedHeapAllocator>; 128], // 使用数组代替VecDeque, 目前最大128
    size: usize, // 当前队列大小
    empty: Arc<TaskSched, LockedHeapAllocator>, // 占位用
}

#[derive(Debug)]
pub struct TaskSched {
    pub id: (usize, usize), // 任务ID(同时是线程id)
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

    pub fn empty() -> Self {
        Self {
            id: (0, 0),
            inner: 
                TicketLock::new(TaskSchedInner {
                    prio: 0,
                    aging: 0,
                    task_cx: TaskContext::zero_init(),
                    task_status: TaskStatus::Ready,
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
        let empty = Arc::new_in(
            TaskSched::empty(),
            *VDSO_HEAP_ALLOCATOR
        );
        let manager = Self {
            ready_heap: core::array::from_fn(|_| {
                // println!("Creating empty task in TaskManager");
                empty.clone()
            }),
            size: 0,
            empty,
        };
        // println!("TaskManager initialized with size: {}", manager.size);
        manager
    }

    // 关键: 不能使用core, 只能使用builtin
    pub fn add(&mut self, task: Arc<TaskSched, LockedHeapAllocator>) {
        if self.size >= self.ready_heap.len() {
            // 不panic，直接返回，由调用者处理
            return;
        }
        // 插入任务到堆中
        self.ready_heap[self.size] = task;
        self.size += 1;
        // 进行上滤操作
        let mut index = self.size - 1;
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
        if self.size == 0 {
            return None; // 没有任务可调度
        }
        // 取出堆顶任务
        let task = self.ready_heap[0].clone();
        // println!("fetch task: {:?} dynamic prio={}", task.id, task.get_dynamic_prio());
        task.inner_exclusive_access().aging = 0; // 重置老化
        // 将最后一个任务放到堆顶
        self.size -= 1;
        if self.size > 0 {
            self.ready_heap[0] = self.ready_heap[self.size].clone();
            self.ready_heap[self.size] = self.empty.clone();
            // 老化
            for i in 0..self.size {
                let mut inner = self.ready_heap[i].inner_exclusive_access();
                inner.aging += 1;
            }
            // 下滤操作
            let mut index = 0;
            while index < self.size {
                let left_child = 2 * index + 1;
                let right_child = 2 * index + 2;
                let mut largest = index;

                if left_child < self.size && self.ready_heap[left_child] > self.ready_heap[largest] {
                    largest = left_child;
                }
                if right_child < self.size && self.ready_heap[right_child] > self.ready_heap[largest] {
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
        }
        Some(task)

    }
}

lazy_static! {
    pub static ref PID2PCB: UPIntrFreeCell<BTreeMap<usize, Arc<ProcessControlBlock>>> =
        unsafe { UPIntrFreeCell::new(BTreeMap::new()) };
}

pub fn add_task(task: Arc<TaskSched, LockedHeapAllocator>) {
    println!("acquiring VDSO lock to add task");
    let mut vdso_inner = VDSO_DATA.inner_exclusive_access();
    if vdso_inner.task_manager.size >= vdso_inner.task_manager.ready_heap.len() {
        drop(vdso_inner); // 释放锁再panic
        panic!("TaskManager is full, cannot add more tasks");
    }
    vdso_inner.task_manager.add(task);
    drop(vdso_inner);
}

pub fn wakeup_task(task: Arc<TaskControlBlock>) {
    let mut task_inner = task.sched.inner_exclusive_access();
    task_inner.task_status = TaskStatus::Ready;
    drop(task_inner);
    add_task(task.sched.clone());
}

pub fn fetch_task() -> Option<Arc<TaskSched, LockedHeapAllocator>> {
    println!("acquiring VDSO lock to fetch task");
    let mut vdso_inner = VDSO_DATA.inner_exclusive_access();
    let result = vdso_inner.task_manager.fetch();
    drop(vdso_inner);
    result
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
