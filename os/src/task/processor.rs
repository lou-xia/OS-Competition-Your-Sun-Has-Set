use super::__switch;
use super::{ProcessControlBlock, TaskContext, TaskControlBlock, TaskSched};
use super::{TaskStatus, fetch_task};
use crate::sync::UPIntrFreeCell;
use crate::task::pid2process;
use crate::trap::TrapContext;
use crate::vdso::vdso::{LockedHeapAllocator, VDSO_DATA};
use alloc::sync::Arc;
use core::arch::asm;
use lazy_static::*;

pub struct Processor {
    // current: Option<Arc<TaskSched, LockedHeapAllocator>>,
    idle_task_cx: TaskContext,
}

impl Processor {
    pub fn new() -> Self {
        Self {
            // current: None
            idle_task_cx: TaskContext::zero_init(),
        }
    }
    fn get_idle_task_cx_ptr(&mut self) -> *mut TaskContext {
        &mut self.idle_task_cx as *mut _
    }

    pub fn take_current(&mut self) -> Option<Arc<TaskSched, LockedHeapAllocator>> {
        let mut inner = VDSO_DATA.inner_exclusive_access();
        let result = inner.current_task[0].take();
        drop(inner);
        result
    }

    pub fn current(&self) -> Option<Arc<TaskSched, LockedHeapAllocator>> {
        let inner = VDSO_DATA.inner_exclusive_access();
        let task = inner.current_task[0].as_ref().cloned();
        drop(inner);
        task
    }
}

lazy_static! {
    pub static ref PROCESSOR: UPIntrFreeCell<Processor> =
        unsafe { UPIntrFreeCell::new(Processor::new()) };
}

pub fn run_tasks() {
    loop {
        let mut processor = PROCESSOR.exclusive_access();
        if let Some(task) = fetch_task() {
            let idle_task_cx_ptr = processor.get_idle_task_cx_ptr();
            // access coming task TCB exclusively
            let next_task_cx_ptr = task.inner_exclusive_session(|task_inner| {
                task_inner.task_status = TaskStatus::Running;
                &task_inner.task_cx as *const TaskContext
            });
            {
                println!("acquired VDSO lock at run_tasks");
                let mut vdso_inner = VDSO_DATA.inner_exclusive_access();
                vdso_inner.current_task[0] = Some(task.clone());
                drop(vdso_inner); // 显式释放VDSO锁
                println!("released VDSO lock at run_tasks");
            }
            // release processor manually
            drop(processor);
            unsafe {
                __switch(idle_task_cx_ptr, next_task_cx_ptr);
            }
        } else {
            println!("no tasks available in run_tasks");
        }
    }
}

pub fn take_current_task() -> Option<Arc<TaskControlBlock>> {
    let task_sched = PROCESSOR.exclusive_access().take_current();
    if let Some(task_sched) = task_sched {
        let (pid, tid) = task_sched.id;
        let process = pid2process(pid).unwrap();
        Some(process.inner_exclusive_access().get_task(tid))
    } else {
        None
    }
}

pub fn current_task() -> Option<Arc<TaskControlBlock>> {
    let task_sched = PROCESSOR.exclusive_access().current();
    if let Some(task_sched) = task_sched {
        let (pid, tid) = task_sched.id;
        let process = pid2process(pid).unwrap();
        Some(process.inner_exclusive_access().get_task(tid))
    } else {
        None
    }
}

pub fn current_process() -> Arc<ProcessControlBlock> {
    current_task().unwrap().process.upgrade().unwrap()
}

pub fn current_user_token() -> usize {
    let task = current_task().unwrap();
    task.get_user_token()
}

pub fn current_trap_cx() -> &'static mut TrapContext {
    current_task()
        .unwrap()
        .inner_exclusive_access()
        .get_trap_cx()
}

pub fn current_trap_cx_user_va() -> usize {
    current_task()
        .unwrap()
        .inner_exclusive_access()
        .res
        .as_ref()
        .unwrap()
        .trap_cx_user_va()
}

pub fn current_kstack_top() -> usize {
    if let Some(task) = current_task() {
        task.kstack.get_top()
    } else {
        let mut boot_stack_top;
        unsafe { asm!("la {},boot_stack_top",out(reg) boot_stack_top) };
        boot_stack_top
    }
}

pub fn schedule(switched_task_cx_ptr: *mut TaskContext) {
    let idle_task_cx_ptr =
        PROCESSOR.exclusive_session(|processor| processor.get_idle_task_cx_ptr());
    unsafe {
        __switch(switched_task_cx_ptr, idle_task_cx_ptr);
    }
}
