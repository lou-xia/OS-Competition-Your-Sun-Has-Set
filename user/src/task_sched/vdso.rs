use core::panic;

use alloc::sync::Arc;

use crate::task_sched::{
    manager::{LockedHeapAllocator, TaskManager}, switch::__switch, task::{TaskContext, TaskSched, TaskStatus}, vdso, PROCESSOR_NUM, USER_VDSO_BASE
};

pub struct VdsoData {
    pub task_manager: TaskManager,
    pub current_task: [Option<Arc<TaskSched, LockedHeapAllocator>>; PROCESSOR_NUM],
}

pub fn user_schedule() {
    unsafe {
        let vdso_data = USER_VDSO_BASE as *mut VdsoData;
        for i in 0..PROCESSOR_NUM {
            if (*vdso_data).current_task[i].is_none() {
                panic!("No current task in user space!");
            }
            println!("!!!!!!!!!!!!");
            if let Some(task) = (*vdso_data).current_task[i].clone() {
                let task_cx = task.inner_exclusive_session(|task_inner| {
                    task_inner.task_status = TaskStatus::Ready;
                    &mut task_inner.task_cx as *mut TaskContext
                });
                let task_manager = &mut (*vdso_data).task_manager;
                if let Some(next_task) = (*task_manager).fetch() {
                    let next_task_cx = task.inner_exclusive_session(|task_inner| {
                        task_inner.task_status = TaskStatus::Running;
                        &task_inner.task_cx as *const TaskContext
                    });
                    (*vdso_data).current_task[i] = Some(next_task);
                    __switch(task_cx, next_task_cx);
                } else {
                    panic!("No next task in user space!");
                }
            } else {
                panic!("No current task in user space!");
            }
        }
    }
}
