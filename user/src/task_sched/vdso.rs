use core::{arch::asm, sync::atomic::{self, AtomicBool}};
use lazy_static::lazy_static;

use alloc::sync::Arc;
use spin::Mutex;

use crate::{syscall::sys_yield, task_sched::{
    manager::{LockedHeapAllocator, TaskManager}, switch::__switch, task::{TaskContext, TaskSched, TaskStatus}, PROCESSOR_NUM, USER_VDSO_BASE
}};

use super::ticket_lock::TicketLock;


#[repr(C)]
#[derive(Debug)]
pub struct VdsoData {
    pub block_sched: AtomicBool, // 阻塞内核抢占
    pub inner: TicketLock<VdsoInner>,
}

#[derive(Debug)]
pub struct VdsoInner {
    pub task_manager: TaskManager,
    pub current_task: [Option<Arc<TaskSched, LockedHeapAllocator>>; PROCESSOR_NUM],
}

impl VdsoData {
    pub fn block_sched(&self) {
        self.block_sched.store(true, atomic::Ordering::Relaxed);
    }

    pub fn unblock_sched(&self) {
        self.block_sched.store(false, atomic::Ordering::Relaxed);
    }

    pub fn locked(&self) -> bool {
        self.block_sched.load(atomic::Ordering::Relaxed)
    }
}

lazy_static! {
    pub static ref VDSO_DATA: &'static VdsoData = {
        // 将 USER_VDSO_BASE 转换为 VdsoData 的借用
        unsafe { core::mem::transmute::<*const VdsoData, &'static VdsoData>(USER_VDSO_BASE as *const VdsoData) }
    };
}

pub fn user_schedule() {
    // 为什么要更改所有逻辑处理器的任务?难道不是谁yield，仅更改对应的逻辑处理器的任务吗?
    for i in 0..PROCESSOR_NUM {
        VDSO_DATA.block_sched(); // 阻塞内核抢占

        println!("user_schedule on processor {}", i);
        let array = USER_VDSO_BASE as *const usize;
        println!("About to print VDSO_DATA...");
        println!("VDSO_DATA: {:?}", *VDSO_DATA);
        println!("VDSO_DATA printed successfully");
        
        println!("About to acquire VDSO lock...");
        // unsafe {
        //     VDSO_DATA.inner.force_unlock();
        // }
        let mut vdso_inner = VDSO_DATA.inner.lock();
        println!("acquired VDSO lock on processor {}", i);

        if let Some(task) = &vdso_inner.current_task[i] {
            let current_task = task.clone();
            let task_manager = &mut vdso_inner.task_manager;
            
            if let Some(next_task_ref) = task_manager.peek() {
                if next_task_ref.id.0 == current_task.id.0 {
                    // 同一地址空间，由用户进行调度
                    assert_ne!(next_task_ref.id.1, current_task.id.1, "Two tasks with same TID in user space!");
                    // 取出下一个任务
                    let next_task = task_manager.fetch().unwrap();
                    let task_cx = current_task.inner_exclusive_session(|task_inner| {
                        task_inner.task_status = TaskStatus::Ready;
                        &mut task_inner.task_cx as *mut TaskContext
                    });
                    let next_task_cx = next_task.inner_exclusive_session(|task_inner| {
                        task_inner.task_status = TaskStatus::Running;
                        &task_inner.task_cx as *const TaskContext
                    });
                    unsafe {
                        println!("\ncurrent: {}-{}, {:#x?}, next: {}-{}, {:#x?}",
                        current_task.id.0, current_task.id.1, *task_cx, next_task.id.0, next_task.id.1, *next_task_cx);
                    }
                    // 添加任务到任务管理器
                    task_manager.add(current_task);
                    // 修改当前任务
                    vdso_inner.current_task[i].replace(next_task);

                    drop(vdso_inner); // 释放锁
                    unsafe {
                        __switch(task_cx, next_task_cx);
                    }
                } else {
                    // 调用系统调用进行调度
                    drop(vdso_inner); // 释放锁
                    VDSO_DATA.unblock_sched(); // 解除阻塞
                    sys_yield();
                }
            } else {
                // 继续运行即可
            }
        } else {
            panic!("No current task in user space!");
        }

        VDSO_DATA.unblock_sched(); // 解除阻塞
    }
}