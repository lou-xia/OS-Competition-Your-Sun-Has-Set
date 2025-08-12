use super::id::{TaskUserRes, DEFAULT_PRIO};
use super::manager::TaskSched;
use super::{KernelStack, ProcessControlBlock, TaskContext, kstack_alloc};
use crate::trap::TrapContext;
use crate::vdso::vdso::{LockedHeapAllocator, VDSO_HEAP_ALLOCATOR};
use crate::{
    mm::PhysPageNum,
    sync::{UPIntrFreeCell, UPIntrRefMut},
};
use alloc::sync::{Arc, Weak};

pub struct TaskControlBlock {
    // immutable
    pub process: Weak<ProcessControlBlock>,
    pub kstack: KernelStack,
    pub sched: Arc<TaskSched, LockedHeapAllocator>,
    // mutable
    pub inner: UPIntrFreeCell<TaskControlBlockInner>,
}

impl TaskControlBlock {
    pub fn inner_exclusive_access(&self) -> UPIntrRefMut<'_, TaskControlBlockInner> {
        self.inner.exclusive_access()
    }

    pub fn get_user_token(&self) -> usize {
        let process = self.process.upgrade().unwrap();
        let inner = process.inner_exclusive_access();
        inner.memory_set.token()
    }
}

pub struct TaskControlBlockInner {
    pub res: Option<TaskUserRes>,
    pub trap_cx_ppn: PhysPageNum,
    pub exit_code: Option<i32>,
}

impl TaskControlBlockInner {
    pub fn get_trap_cx(&self) -> &'static mut TrapContext {
        self.trap_cx_ppn.get_mut()
    }
}

impl TaskControlBlock {
    pub fn new(
        process: Arc<ProcessControlBlock>,
        ustack_base: usize,
        alloc_user_res: bool,
    ) -> Self {
        let res = TaskUserRes::new(Arc::clone(&process), ustack_base, alloc_user_res);
        let trap_cx_ppn = res.trap_cx_ppn();
        let kstack = kstack_alloc();
        let kstack_top = kstack.get_top();
        let sched = TaskSched::new(
                    process.pid.0,
                    res.tid,
                    DEFAULT_PRIO,
                    TaskContext::goto_trap_return(kstack_top),
                    TaskStatus::Ready,
                );
        let r = Self {
            process: Arc::downgrade(&process),
            kstack,
            sched: Arc::new_in(sched, *VDSO_HEAP_ALLOCATOR),
            inner: unsafe {
                UPIntrFreeCell::new(TaskControlBlockInner {
                    res: Some(res),
                    trap_cx_ppn,
                    exit_code: None,
                })
            },
        };
        r
    }
}

#[derive(Debug)]
#[derive(Copy, Clone, PartialEq)]
pub enum TaskStatus {
    Ready,
    Running,
    Blocked,
}
