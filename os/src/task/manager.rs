use super::{ProcessControlBlock, TaskContext, TaskControlBlock, TaskStatus};
use crate::sync::UPIntrFreeCell;
use alloc::collections::btree_set::BTreeSet;
use alloc::collections::BTreeMap;
use alloc::sync::Arc;
use lazy_static::*;

pub struct TaskManager {
    // ready_queue: VecDeque<Task>,
    ready_queue: BTreeSet<Arc<UPIntrFreeCell<TaskSched>>>,
}

// const INITIAL_TIME_SLICES: [usize; MAX_PRIO + 1] = [
//     0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 1, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2
// ];


pub struct TaskSched {
    pub id: (usize, usize), // 任务ID(同时是线程id)
    pub prio: usize, // 静态优先级
    pub aging: usize, // 老化机制, 用于防止饥饿
    pub task_cx: TaskContext,
    pub task_status: TaskStatus,
}

impl TaskSched {
    pub fn new(pid: usize, tid: usize, prio: usize, task_cx: TaskContext, task_status: TaskStatus) -> Self {
        Self {
            id: (pid, tid),
            prio,
            aging: 0,
            task_cx,
            task_status,
        }
    }

    pub fn get_dynamic_prio(&self) -> usize {
        self.prio + self.aging
    }
}

impl PartialEq for TaskSched {
    fn eq(&self, other: &Self) -> bool {
        (self.get_dynamic_prio()) == (other.get_dynamic_prio()) && (self.id == other.id)
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
                p1.cmp(&p2).reverse()
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

impl PartialEq for UPIntrFreeCell<TaskSched> {
    fn eq(&self, other: &Self) -> bool {
        (self.exclusive_access().get_dynamic_prio()) == (other.exclusive_access().get_dynamic_prio()) && (self.exclusive_access().id == other.exclusive_access().id)
    }
}

impl PartialOrd for UPIntrFreeCell<TaskSched> {
    // 大根堆, 优先级高的任务在前
    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
        let p1 = self.exclusive_access().get_dynamic_prio();
        let p2 = other.exclusive_access().get_dynamic_prio();
        Some(
            if p1 == p2 {
                self.exclusive_access().id.cmp(&other.exclusive_access().id)
            } else {
                p1.cmp(&p2).reverse()
            }
        )
    }
}

impl Eq for UPIntrFreeCell<TaskSched> {}

impl Ord for UPIntrFreeCell<TaskSched> {
    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
        self.partial_cmp(other).unwrap_or(core::cmp::Ordering::Equal)
    }
}

impl TaskManager {
    pub fn new() -> Self {
        Self {
            ready_queue: BTreeSet::new(),
            
            // ready_queue: VecDeque::new(),
        }
    }
    pub fn add(&mut self, task: Arc<TaskControlBlock>) {
        self.ready_queue.insert(Task::new(task));
        // self.ready_queue.push_back(Task::new(task));
    }

    pub fn fetch(&mut self) -> Option<Arc<UPIntrFreeCell<TaskSched>>> {
        let fetch_task = self.ready_queue.pop_first();

        // 将所有任务的老化值增加1, BTreeSet无法iter_mut, 所以需要先收集
        let mut collect = BTreeSet::new();
        while let Some(mut task) = self.ready_queue.pop_first() {
            task.exclusive_access().aging += 1;
            // println!("aging task {:?} to {}, dynamic priority: {}", task.id, task.aging, task.get_dynamic_prio());
            collect.insert(task);
        }
        // 重新插入老化后的任务
        self.ready_queue.extend(collect);

        // fetch_task.map(|t| t.exclusive_access())
        fetch_task
        
        // self.ready_queue.pop_front().map(|task| {task.task})

    }
}

lazy_static! {
    pub static ref TASK_MANAGER: UPIntrFreeCell<TaskManager> =
        unsafe { UPIntrFreeCell::new(TaskManager::new()) };
    pub static ref PID2PCB: UPIntrFreeCell<BTreeMap<usize, Arc<ProcessControlBlock>>> =
        unsafe { UPIntrFreeCell::new(BTreeMap::new()) };
}

pub fn add_task(task: Arc<TaskControlBlock>) {
    TASK_MANAGER.exclusive_access().add(task);
}

pub fn wakeup_task(task: Arc<TaskControlBlock>) {
    let mut task_inner = task.inner_exclusive_access();
    task_inner.task_status = TaskStatus::Ready;
    drop(task_inner);
    add_task(task);
}

pub fn fetch_task() -> Option<Arc<UPIntrFreeCell<TaskSched>>> {
    TASK_MANAGER.exclusive_access().fetch()
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
