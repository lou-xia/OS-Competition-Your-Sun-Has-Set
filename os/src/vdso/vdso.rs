use core::{alloc::Layout, ptr::NonNull};

use buddy_system_allocator::LockedHeap;
use lazy_static::lazy_static;
use log::info;
use crate::{config::{KERNEL_VDSO_BASE, PAGE_SIZE, PROCESSOR_NUM, VDSO_DATA_PAGES, VDSO_HEAP_PAGES, VDSO_PAGES}, mm::{frame_alloc_more, FrameTracker}, sync::UPIntrFreeCell, task::{TaskManager, TaskSched}};
use alloc::{alloc::{AllocError, Allocator}, sync::Arc, vec::Vec};

pub struct VdsoData {
    pub task_manager: TaskManager,
    pub current_task: [Option<Arc<TaskSched, LockedHeapAllocator>>; PROCESSOR_NUM],
}

impl VdsoData {
    pub fn new() -> Self {
        Self {
            task_manager: TaskManager::new(),
            current_task: [None; PROCESSOR_NUM],
        }
    }
}

lazy_static! {
    pub static ref VDSO_PAGE: Arc<Vec<FrameTracker>> = {
        // 分配VDSO所需的物理页, 16页给堆分配器, 1页给VDSO数据
        let mut ppn = frame_alloc_more(VDSO_PAGES).unwrap();
        // for i in ppn.iter() {
        //     println!("VDSO page at PPN: {:#x}", i.ppn.0);
        // }
        ppn.reverse();
        Arc::new(ppn)
    };
    pub static ref VDSO_DATA: Arc<UPIntrFreeCell<&'static mut VdsoData>> = {
        // 取第一页
        let va: usize = KERNEL_VDSO_BASE;
        // println!("VDSO data at PA: {:#x}", pa.0);

        // vdso转换成byte slice
        let mut data = VdsoData::new();
        let init_data = unsafe {
            core::slice::from_raw_parts_mut(&mut data as *mut VdsoData as *mut u8, core::mem::size_of::<VdsoData>())
        };

        // 将数据写入第一页
        unsafe {
            core::ptr::copy_nonoverlapping(init_data.as_ptr(), va as *mut u8, init_data.len());
        }

        core::mem::forget(data); // 防止数据被释放

        println!("VDSO data initialized");
        // &mut *data
        unsafe {Arc::new(UPIntrFreeCell::new(&mut *(va as *mut VdsoData)))}
    };
    
}

lazy_static! {
    static ref VDSO_HEAP: &'static LockedHeap = {
        let va: usize = KERNEL_VDSO_BASE + core::mem::size_of::<VdsoData>();
        let heap = LockedHeap::empty(); // 创建一个空的堆
        unsafe {
            // 写入到va地址上
            core::ptr::write(va as *mut LockedHeap, heap);
            core::mem::transmute(va as *const LockedHeap)
        }
    };

    // 用于分配Arc<TaskSched>所需的内存
    pub static ref VDSO_HEAP_ALLOCATOR: LockedHeapAllocator = {
        info!("[kernel] VDSO heap allocator initialized");
        let alloc = LockedHeapAllocator(&VDSO_HEAP);
        unsafe {
            // 将前半交给堆分配器
            alloc.0.lock().init(KERNEL_VDSO_BASE + PAGE_SIZE * VDSO_DATA_PAGES, VDSO_HEAP_PAGES * PAGE_SIZE);
        }
        println!("VDSO heap allocator address: {:p}", alloc.0);
        println!("VDSO heap allocator: {:p}", &alloc);
        alloc
    };
}

#[derive(Clone)]
pub struct LockedHeapAllocator(&'static LockedHeap);

unsafe impl Send for LockedHeapAllocator {}

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

