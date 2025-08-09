pub mod vdso;
pub mod manager;
pub mod task;
pub mod ticket_lock;

mod switch;

pub const USER_VDSO_BASE: usize = usize::MAX - 256 * 0x4000_0000 + 1;
pub const VDSO_DATA_PAGES: usize = 1;
pub const VDSO_HEAP_PAGES: usize = 1 << 4;
pub const VDSO_SIZE: usize = VDSO_DATA_PAGES + VDSO_HEAP_PAGES;
pub const PAGE_SIZE: usize = 0x1000;
pub const PROCESSOR_NUM: usize = 1;