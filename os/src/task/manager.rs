use super::{ProcessControlBlock, TaskControlBlock, TaskStatus, MAX_PRIO, MIN_PRIO};
use crate::sync::UPIntrFreeCell;
use alloc::collections::binary_heap::BinaryHeap;
use alloc::collections::btree_set::BTreeSet;
use alloc::collections::BTreeMap;
use alloc::sync::Arc;
use lazy_static::*;

pub struct TaskManager {
    ready_queue: BinaryHeap<Task>,
    id_set: BTreeSet<(usize, usize)>, // 用于记录任务ID, 防止重复添加
}

const INITIAL_TIME_SLICES: [usize; MAX_PRIO + 1] = [
    0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 1, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2
];

struct Task {
    id: (usize, usize), // 任务ID(同时是线程id)
    task: Arc<TaskControlBlock>,
    remaining_time: usize, // 剩余时间片
    aging: usize, // 老化机制, 用于防止饥饿
}

impl Task {
    fn new(task: Arc<TaskControlBlock>) -> Self {
        let task_inner = task.inner_exclusive_access();
        let res = task_inner.res.as_ref().unwrap();
        let pid = res.process.upgrade().unwrap().pid.0;
        Self {
            id: (pid, res.tid), // 线程id, 同时是任务唯一标识
            task: Arc::clone(&task),
            remaining_time: INITIAL_TIME_SLICES[res.prio], // 初始时间片
            aging: 0, // 初始老化值
        }
    }

    // 因为prio可能被修改, 每次获取优先级时都需要重新计算
    fn get_prio(&self) -> usize {
        self.task.inner_exclusive_access().res.as_ref().unwrap().prio as usize
    }

    fn get_dynamic_prio(&self) -> usize {
        self.get_prio() - self.aging
    }
}

impl PartialEq for Task {
    fn eq(&self, other: &Self) -> bool {
        (self.get_dynamic_prio()) == (other.get_dynamic_prio())
    }
}

impl PartialOrd for Task {
    // 大根堆, 优先级高的任务在前
    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
        Some((self.get_dynamic_prio()).cmp(&other.get_dynamic_prio()))
    }
}

impl Eq for Task {}

impl Ord for Task {
    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
        (self.get_dynamic_prio()).cmp(&other.get_dynamic_prio())
    }
}


impl TaskManager {
    pub fn new() -> Self {
        Self {
            ready_queue: BinaryHeap::new(),
            id_set: BTreeSet::new(),
        }
    }
    pub fn add(&mut self, task: Arc<TaskControlBlock>) {
        let task_inner = task.inner_exclusive_access();
        let res = task_inner.res.as_ref().unwrap();
        let tid = res.tid;
        let pid = res.process.upgrade().unwrap().pid.0;
        // println!("add task: {}, prio: {}", id, res.prio);
        drop(task_inner); // 释放锁, 否则后面Task::new会出错
        if self.id_set.contains(&(pid, tid)) {
            
        } else {
            self.id_set.insert((pid, tid)); // 插入id_set, 防止重复添加
            let new_task = Task::new(Arc::clone(&task));
            self.ready_queue.push(new_task);
        }
        // self.ready_queue.push(Task::new(task));
    }

    pub fn fetch(&mut self) -> Option<Arc<TaskControlBlock>> {
        if let Some(mut task) = self.ready_queue.pop() {
            task.remaining_time -= 1; // 执行时间片减一
            let fetch_task = task.task.clone();
            // println!(
            //     "fetch task: {:?}, remaining time: {}, aging: {}, size of ready_queue: {}",
            //     task.id, task.remaining_time, task.aging, self.ready_queue.len()
            // );
            if task.remaining_time != 0 {
                if task.get_dynamic_prio() != MIN_PRIO {
                    task.aging += 1; // 老化, 使优先级降低
                }
                self.ready_queue.push(task); // 时间片还没用完, 重新放回队列
            } else {
                self.id_set.remove(&task.id); // 时间片用完, 从id_set中移除
            }
            Some(fetch_task)
        } else {
            None
        }
        // self.ready_queue.pop().map(|task| {task.task})

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

pub fn fetch_task() -> Option<Arc<TaskControlBlock>> {
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
