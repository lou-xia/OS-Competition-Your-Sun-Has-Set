use core::{panic, sync::atomic::{self, AtomicBool}};

use alloc::sync::Arc;
use lazy_static::lazy_static;
use spin::Mutex;

use crate::{syscall::sys_yield, task_sched::{
    manager::{LockedHeapAllocator, TaskManager}, switch::__switch_user, task::{TaskSched, TaskStatus}, trap::TrapContext
}};

use super::{PAGE_SIZE, PROCESSOR_NUM, TRAP_CONTEXT_BASE, USER_VDSO_BASE, VDSO_TRAP_CONTEXT_PTR_BASE};

// #[repr(C)]
// #[derive(Debug)]
// pub struct VdsoData {
//     pub block_sched: AtomicBool, // 阻塞内核抢占
//     pub inner: TicketLock<VdsoInner>,
// }

// #[derive(Debug)]
// pub struct VdsoInner {
//     pub task_manager: TaskManager,
//     pub current_task: [Option<Arc<TaskSched, LockedHeapAllocator>>; PROCESSOR_NUM],
// }

#[derive(Debug)]
pub struct VdsoData {
    pub block_sched: AtomicBool, // 阻塞内核抢占
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
    pub static ref VDSO_DATA: Mutex<&'static mut VdsoData> = {
        // 将 USER_VDSO_BASE 转换为 VdsoData 的借用
        Mutex::new(
            unsafe { &mut *(USER_VDSO_BASE as *mut VdsoData) }
        )
    };
}

fn trap_cx_bottom_from_tid(tid: usize) -> usize {
    TRAP_CONTEXT_BASE - tid * PAGE_SIZE
}

fn get_trap_cx_ptr(tid: usize) -> *mut TrapContext {
    unsafe {
        &mut *(trap_cx_bottom_from_tid(tid) as *mut TrapContext)
    }
}

pub fn user_schedule() {
    // sys_yield();
    // return;

    // 为什么要更改所有逻辑处理器的任务?难道不是谁yield，仅更改对应的逻辑处理器的任务吗?
    for i in 0..PROCESSOR_NUM {
        let mut vdso_inner = VDSO_DATA.lock();
        vdso_inner.block_sched(); // 阻塞内核抢占


        if let Some(task) = &vdso_inner.current_task[i] {
            let current_task = task.clone();
            let task_manager = &mut vdso_inner.task_manager;
            
            if let Some(next_task_ref) = task_manager.peek() {
                if next_task_ref.id.0 == current_task.id.0 {
                    // 同一地址空间，由用户进行调度
                    assert_ne!(next_task_ref.id.1, current_task.id.1, "Two tasks with same TID in user space!");
                    // 取出下一个任务
                    let next_task = task_manager.fetch().unwrap();
                    current_task.inner_exclusive_session(|task_inner| {
                        task_inner.task_status = TaskStatus::Ready;
                    });
                    next_task.inner_exclusive_session(|task_inner| {
                        task_inner.task_status = TaskStatus::Running;
                    });
                    // unsafe {
                    //     println!("\ncurrent: {}-{}, {:#x?}, next: {}-{}, {:#x?}",
                    //     current_task.id.0, current_task.id.1, *task_cx, next_task.id.0, next_task.id.1, *next_task_cx);
                    // }

                    // 获取2个TrapContext
                    let current_trap_cx  = get_trap_cx_ptr(current_task.id.1);
                    let next_trap_cx = get_trap_cx_ptr(next_task.id.1);
                    // 添加任务到任务管理器
                    task_manager.add(current_task);
                    // 修改当前任务
                    vdso_inner.current_task[i].replace(next_task);
                    drop(vdso_inner); // 释放锁

                    unsafe {
                        // 更新TRAP_CONTEXT_PTR指向当前任务的trap context
                        (VDSO_TRAP_CONTEXT_PTR_BASE as *mut usize).write(next_trap_cx as usize);
                    }
                    unsafe {
                        __switch_user(current_trap_cx, next_trap_cx);
                    }

                    // println!("user_schedule branch 1");

                    let vdso_inner = VDSO_DATA.lock();
                    vdso_inner.unblock_sched();
                } else {
                    // 调用系统调用进行调度
                    vdso_inner.unblock_sched();
                    drop(vdso_inner); // 释放锁
                    // println!("user_schedule branch 2");
                    sys_yield();
                }
            } else {
                vdso_inner.unblock_sched();
                drop(vdso_inner); // 释放锁
                sys_yield(); // 考虑一下这个分支和上一个分支是否有更好的选择
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