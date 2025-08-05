use core::{alloc::Layout, ptr::NonNull};

use buddy_system_allocator::LockedHeap;
use lazy_static::lazy_static;
use crate::{config::VDSO_SIZE, mm::{frame_alloc, FrameTracker, PhysAddr}, sync::UPIntrFreeCell};
use alloc::{alloc::{AllocError, Allocator}, sync::Arc};

pub struct VdsoData {
    pub num: usize,
}

impl VdsoData {
    pub fn new() -> Self {
        Self {
            num: 0,
        }
    }
}

lazy_static! {
    pub static ref VDSO_PAGE: Arc<FrameTracker> = {
        let ppn = frame_alloc().unwrap();
        unsafe {
            // 将前半交给堆分配器
            TASK_SCHED_ALLOCATOR.0.lock().init(PhysAddr::from(ppn.ppn).into(), VDSO_SIZE / 2);
        }
        Arc::new(ppn)
    };
    pub static ref VDSO_DATA: Arc<UPIntrFreeCell<&'static mut VdsoData>> = {
        let pa = VDSO_PAGE.ppn;
        let data = pa.get_mut::<VdsoData>();
        *pa.get_mut::<VdsoData>() = VdsoData::new();
        // &mut *data
        Arc::new(unsafe {UPIntrFreeCell::new(data)})
    };
    // 用于分配Arc<TaskSched>所需的内存
    pub static ref TASK_SCHED_ALLOCATOR: LockedHeapAllocator = LockedHeapAllocator(Arc::new(LockedHeap::empty()));
}

#[derive(Clone)]
pub struct LockedHeapAllocator(pub Arc<LockedHeap>);

unsafe impl Allocator for LockedHeapAllocator {
    fn allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
        let mut heap = self.0.lock();
        let ptr = heap.alloc(layout).map_err(|_| AllocError)?;
        Ok(NonNull::slice_from_raw_parts(ptr, layout.size()))
    }

    unsafe fn deallocate(&self, ptr: NonNull<u8>, layout: Layout) {
        let mut heap = self.0.lock();
        heap.dealloc(ptr, layout);
    }
}

