use crate::trap::trap_return;

#[repr(C)]
pub struct TaskContext {
    ra: usize,
    sp: usize,
    s: [usize; 12],
    pub sepc: usize,
    pub user_sp: usize,
}

impl TaskContext {
    pub fn zero_init() -> Self {
        Self {
            ra: 0,
            sp: 0,
            s: [0; 12],
            sepc: 0,
            user_sp: 0,
        }
    }
    pub fn goto_trap_return(kstack_ptr: usize, ustack_ptr: usize, entry: usize) -> Self {
        Self {
            ra: trap_return as usize,
            sp: kstack_ptr,
            s: [0; 12],
            sepc: entry,
            user_sp: ustack_ptr,
        }
    }
}
