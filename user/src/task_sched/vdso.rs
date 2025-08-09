use core::panic;

use alloc::sync::Arc;

use crate::{syscall::sys_yield, task_sched::{
    manager::{LockedHeapAllocator, TaskManager}, switch::__switch, task::{TaskContext, TaskSched, TaskStatus}, PROCESSOR_NUM, USER_VDSO_BASE
}};

pub struct VdsoData {
    pub task_manager: TaskManager,
    pub current_task: [Option<Arc<TaskSched, LockedHeapAllocator>>; PROCESSOR_NUM],
}

pub fn user_schedule() {
    // 将 USER_VDSO_BASE 转换为 VdsoData 的可变借用
    let vdso_data = unsafe {
        &mut *(USER_VDSO_BASE as *mut VdsoData)
    };
    
    // 为什么要更改所有逻辑处理器的任务?难道不是谁yield，仅更改对应的逻辑处理器的任务吗?
    for i in 0..PROCESSOR_NUM {
        if vdso_data.current_task[i].is_none() {
            panic!("No current task in user space!");
        }
        // println!("!!!!!!!!!!!!");
        // println!("tasks: {}", vdso_data.task_manager.get_size());

        // println!(1);
        if let Some(task) = vdso_data.current_task[i].clone() {
            // println!(2);
            let task_manager = &mut vdso_data.task_manager;
            if let Some(next_task_ref) = task_manager.peek() {
                if next_task_ref.id.0 == task.id.0 {
                    // 同一地址空间，由用户进行调度
                    assert_ne!(next_task_ref.id.1, task.id.1, "Two tasks with same TID in user space!");
                    // 取出下一个任务
                    let next_task = task_manager.fetch().unwrap();
                    let task_cx = task.inner_exclusive_session(|task_inner| {
                        task_inner.task_status = TaskStatus::Ready;
                        &mut task_inner.task_cx as *mut TaskContext
                    });
                    let next_task_cx = task.inner_exclusive_session(|task_inner| {
                        task_inner.task_status = TaskStatus::Running;
                        &task_inner.task_cx as *const TaskContext
                    });
                    vdso_data.current_task[i] = Some(next_task);
                    // 添加任务到任务管理器
                    task_manager.add(task);
                    unsafe {
                        __switch(task_cx, next_task_cx);
                    }
                } else {
                    // 调用系统调用进行调度
                    sys_yield();
                }
            } else {
                // 继续运行即可
            }
        } else {
            panic!("No current task in user space!");
        }
    }
}
