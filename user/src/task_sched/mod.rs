pub mod vdso;
mod manager;
mod task;
mod ticket_lock;
mod trap;
mod switch;

pub(self) const TRAP_CONTEXT_BASE: usize = usize::MAX - 2 * PAGE_SIZE + 1;
pub(self) const USER_VDSO_BASE: usize = usize::MAX - 256 * 0x4000_0000 + 1;
pub(self) const VDSO_DATA_PAGES: usize = 1;
pub(self) const VDSO_HEAP_PAGES: usize = 1 << 4;
pub(self) const VDSO_TRAP_CONTEXT_PAGES: usize = 1;
pub(self) const VDSO_TRAP_CONTEXT_PTR_BASE: usize = USER_VDSO_BASE + (VDSO_HEAP_PAGES + VDSO_DATA_PAGES) * PAGE_SIZE;
pub(self) const VDSO_PAGES: usize = VDSO_DATA_PAGES + VDSO_HEAP_PAGES + VDSO_TRAP_CONTEXT_PAGES;
pub(self) const PAGE_SIZE: usize = 0x1000;
pub(self) const PROCESSOR_NUM: usize = 1;