use core::{
    panic,
    sync::atomic::{self, AtomicBool},
};

use alloc::sync::Arc;
use lazy_static::lazy_static;
use spin::Mutex;

use crate::{
    syscall::sys_yield,
    task_sched::{
        manager::{LockedHeapAllocator, TaskManager},
        switch::__switch_user,
        task::{TaskSched, TaskStatus},
        trap::TrapContext,
    },
};

use super::{
    PAGE_SIZE, PROCESSOR_NUM, TRAP_CONTEXT_BASE, USER_VDSO_BASE, VDSO_TRAP_CONTEXT_PTR_BASE,
};

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
    unsafe { &mut *(trap_cx_bottom_from_tid(tid) as *mut TrapContext) }
}

pub fn user_schedule() {
    // TODO：多核时判断当前cpu的编号
    // let current_processor = get_current_processor();
    let current_processor = 0;
    assert!(current_processor < PROCESSOR_NUM);
    let mut vdso_inner = VDSO_DATA.lock();
    vdso_inner.block_sched(); // 阻塞内核抢占

    let current_task = vdso_inner.current_task[current_processor].clone().unwrap();

    if let Some(next_task_ref) = vdso_inner.task_manager.peek() {
        if next_task_ref.id.0 == current_task.id.0 {
            // 同一地址空间，由用户进行调度
            assert_ne!(
                next_task_ref.id.1, current_task.id.1,
                "Two tasks with same TID in user space!"
            );
            // 取出下一个任务
            let next_task = vdso_inner.task_manager.fetch().unwrap();
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
            let current_trap_cx = get_trap_cx_ptr(current_task.id.1);
            let next_trap_cx = get_trap_cx_ptr(next_task.id.1);
            // 修改当前任务
            vdso_inner.current_task[current_processor].replace(next_task);
            // 添加任务到任务管理器
            vdso_inner.task_manager.add(current_task);
            
            drop(vdso_inner); // 释放锁

            unsafe {
                __switch_user(current_trap_cx, next_trap_cx);
            }

            unsafe {
                // 更新TRAP_CONTEXT_PTR指向当前任务的trap context
                (VDSO_TRAP_CONTEXT_PTR_BASE as *mut usize).write(next_trap_cx as usize);
            }

            let vdso_inner = VDSO_DATA.lock();
            vdso_inner.unblock_sched();
        } else {
            // 调用系统调用进行调度
            vdso_inner.unblock_sched();
            drop(vdso_inner); // 释放锁
            sys_yield();
        }
    } else {
        // 调用系统调用进行调度
        vdso_inner.unblock_sched();
        drop(vdso_inner); // 释放锁
        sys_yield();
    }
}

pub fn user_prior(prior: usize) -> isize {
    // TODO：多核时判断当前cpu的编号
    // let current_processor = get_current_processor();
    let current_processor = 0;
    assert!(current_processor < PROCESSOR_NUM);
    let vdso_inner = VDSO_DATA.lock();
    vdso_inner.block_sched();
    if let Some(task) = &vdso_inner.current_task[current_processor] {
        let current_task = task.clone();
        current_task.inner_exclusive_access().prio = prior;
    } else {
        panic!("No current task in user space!");
    }
    vdso_inner.unblock_sched();
    0
}

#[unsafe(no_mangle)]
pub extern "C" fn user_schedule_unlock() {
    let vdso_data = unsafe {
        // 将 USER_VDSO_BASE 转换为 VdsoData 的可变借用
        &mut *(USER_VDSO_BASE as *mut VdsoData)
    };
    vdso_data.block_sched.store(false, atomic::Ordering::SeqCst); // 恢复内核抢占
}
