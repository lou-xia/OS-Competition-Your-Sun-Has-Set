use super::ticket_lock::{TicketGuard, TicketLock};



pub struct TaskSched {
    pub id: (usize, usize), // 任务ID(同时是线程id)
    pub inner: TicketLock<TaskSchedInner>,
}

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

#[derive(Copy, Clone, PartialEq)]
pub enum TaskStatus {
    Ready,
    Running,
    Blocked,
}
