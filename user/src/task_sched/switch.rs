use core::arch::global_asm;

use crate::task_sched::task::TaskContext;

global_asm!(include_str!("switch.S"));

unsafe extern "C" {
    /// Switch to the context of `next_task_cx_ptr`, saving the current context
    /// in `current_task_cx_ptr`.
    pub unsafe fn __switch_user(
        current_task_cx_ptr: *mut TaskContext,
        next_task_cx_ptr: *const TaskContext,
    );
}
