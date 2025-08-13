use core::sync::atomic::AtomicBool;

use super::ticket_lock::{TicketGuard, TicketLock};


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

    pub fn inner_exclusive_access(&self) -> TicketGuard<'_, TaskSchedInner> {
        // println!(1);
        self.inner.lock()
    }

    pub fn inner_exclusive_session<F, R>(&self, f: F) -> R
    where
        F: FnOnce(&mut TaskSchedInner) -> R,
    {
        let mut guard = self.inner.lock();
        f(&mut *guard)
    }

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

#[repr(C)]
#[derive(Debug)]
pub struct TaskContext {
    ra: usize,
    sp: usize,
    s: [usize; 12],
    sepc: usize,
    user_sp: usize,
}

impl TaskContext {
    pub fn zero_init() -> Self {
        Self {
            ra: 0,
            sp: 0,
            s: [0; 12],
            sepc: 0,
            user_sp: 0,
        }
    }
}

#[derive(Copy, Clone, PartialEq, Debug)]
pub enum TaskStatus {
    Ready,
    Running,
    Blocked,
}
