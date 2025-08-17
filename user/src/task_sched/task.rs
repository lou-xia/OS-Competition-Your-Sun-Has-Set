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
    pub dynamic: usize, // 老化机制, 用于防止饥饿
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
        inner.dynamic
    }

    #[inline]
    pub fn add_dynamic_priority(&self, delta: usize) {
        let mut inner = self.inner_exclusive_access();
        inner.dynamic += delta;
    }

    #[inline]
    pub fn clear_dynamic_priority(&self) {
        let mut inner = self.inner_exclusive_access();
        inner.dynamic = inner.prio;
    }
}

impl PartialEq for TaskSched {
    fn eq(&self, other: &Self) -> bool {
        self.get_dynamic_prio() == other.get_dynamic_prio()
    }
}

impl PartialOrd for TaskSched {
    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
        let p1 = self.get_dynamic_prio();
        let p2 = other.get_dynamic_prio();
        Some(p1.cmp(&p2))
    }
}

impl Eq for TaskSched {}

impl Ord for TaskSched {
    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
        let p1 = self.get_dynamic_prio();
        let p2 = other.get_dynamic_prio();
        p1.cmp(&p2)
    }
}

#[repr(C)]
#[derive(Debug)]
pub struct TaskContext {
    ra: usize,
    sp: usize,
    s: [usize; 12],
}

impl TaskContext {
    pub fn zero_init() -> Self {
        Self {
            ra: 0,
            sp: 0,
            s: [0; 12],
        }
    }
}

#[derive(Copy, Clone, PartialEq, Debug)]
pub enum TaskStatus {
    Ready,
    Running,
    Blocked,
}
