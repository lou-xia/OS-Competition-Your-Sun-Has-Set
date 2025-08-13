#[allow(unused)]

pub const USER_STACK_SIZE: usize = 4096 * 2;
pub const KERNEL_STACK_SIZE: usize = 4096 * 2;
pub const KERNEL_HEAP_SIZE: usize = 0x100_0000;
pub const PAGE_SIZE: usize = 0x1000;
pub const PAGE_SIZE_BITS: usize = 0xc;

pub const TRAMPOLINE: usize = usize::MAX - PAGE_SIZE + 1;
pub const TRAP_CONTEXT_BASE: usize = TRAMPOLINE - PAGE_SIZE;

pub const KERNEL_VDSO_BASE: usize = usize::MAX - 256 * 0x4000_0000 + 1;
pub const USER_VDSO_BASE: usize = KERNEL_VDSO_BASE;
pub const VDSO_HEAP_PAGES: usize = 1 << 4; // 16 pages
pub const VDSO_DATA_PAGES: usize = 1; // 1 page for VdsoData
pub const VDSO_TRAP_CONTEXT_PAGES: usize = 1; // 1 page for trap context ptr
pub const VDSO_TRAP_CONTEXT_START: usize = KERNEL_VDSO_BASE + (VDSO_HEAP_PAGES + VDSO_DATA_PAGES) * PAGE_SIZE;
// pub const VDSO_TRAP_CONTEXT_START_SPECIAL: usize = VDSO_TRAP_CONTEXT_START + PAGE_SIZE; // 比较恶心, 页表项设置U标识后S特权级无法访问，就会导致Trap出点问题，这里单独为Trap开一个地址
pub const VDSO_PAGES: usize = VDSO_HEAP_PAGES + VDSO_DATA_PAGES + VDSO_TRAP_CONTEXT_PAGES; // 18 pages in total
pub const PROCESSOR_NUM: usize = 1;

pub use crate::board::{CLOCK_FREQ, MEMORY_END, MMIO};
