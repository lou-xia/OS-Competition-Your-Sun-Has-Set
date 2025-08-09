pub mod vdso;
pub mod manager;
pub mod task;
pub mod ticket_lock;

mod switch;

pub const USER_VDSO_BASE: usize = usize::MAX - 256 * 0x4000_0000 + 1;
pub const VDSO_SIZE: usize = 17;
pub const PAGE_SIZE: usize = 0x1000;
pub const PROCESSOR_NUM: usize = 1;