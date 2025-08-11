use core::{panic, sync::atomic::{self, AtomicBool}};

use alloc::sync::Arc;

use crate::{syscall::sys_yield, task_sched::{
    manager::{LockedHeapAllocator, TaskManager}, switch::__switch, task::{TaskContext, TaskSched, TaskStatus}, PROCESSOR_NUM, USER_VDSO_BASE
}};

pub struct VdsoData {
    pub task_manager: TaskManager,
    pub current_task: [Option<Arc<TaskSched, LockedHeapAllocator>>; PROCESSOR_NUM],
    pub block_sched: AtomicBool, // 阻塞内核抢占
}

pub fn user_schedule() {
    let vdso_data = unsafe {
            // 将 USER_VDSO_BASE 转换为 VdsoData 的可变借用
            &mut *(USER_VDSO_BASE as *mut VdsoData)
        };

    vdso_data.block_sched.store(true, atomic::Ordering::SeqCst); // 阻塞内核抢占
    // 为什么要更改所有逻辑处理器的任务?难道不是谁yield，仅更改对应的逻辑处理器的任务吗?
    for i in 0..PROCESSOR_NUM {
        if vdso_data.current_task[i].is_none() {
            panic!("No current task in user space!");
        }
        if let Some(task) = vdso_data.current_task[i].clone() {
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
                    let next_task_cx = next_task.inner_exclusive_session(|task_inner| {
                        task_inner.task_status = TaskStatus::Running;
                        &task_inner.task_cx as *const TaskContext
                    });
                    unsafe {println!("\ncurrent: {}-{}, {:#x?}, next: {}-{}, {:#x?}", task.id.0, task.id.1, *task_cx, next_task.id.0, next_task.id.1, *next_task_cx);}
                    vdso_data.current_task[i] = Some(next_task);
                    // 添加任务到任务管理器
                    task_manager.add(task);
                    unsafe {
                        __switch(task_cx, next_task_cx);
                    }
                } else {
                    // 调用系统调用进行调度
                    // println!("current: {}-{}", task.id.0, task.id.1);
                    drop(task);
                    vdso_data.block_sched.store(false, atomic::Ordering::SeqCst); // 恢复内核抢占
                    sys_yield();
                }
            } else {
                // 继续运行即可
                vdso_data.block_sched.store(false, atomic::Ordering::SeqCst); // 恢复内核抢占
            }
        } else {
            panic!("No current task in user space!");
        }
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn user_schedule_unlock() {
    let vdso_data = unsafe {
            // 将 USER_VDSO_BASE 转换为 VdsoData 的可变借用
            &mut *(USER_VDSO_BASE as *mut VdsoData)
        };
    vdso_data.block_sched.store(false, atomic::Ordering::SeqCst); // 恢复内核抢占
}