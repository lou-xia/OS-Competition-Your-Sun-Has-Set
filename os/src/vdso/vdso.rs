use lazy_static::lazy_static;
use crate::{mm::{frame_alloc, FrameTracker}, sync::UPIntrFreeCell};
use alloc::sync::Arc;

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
    pub static ref VDSO_PAGE: Arc<FrameTracker> = Arc::new(frame_alloc().unwrap());
    pub static ref VDSO_DATA: Arc<UPIntrFreeCell<&'static mut VdsoData>> = {
        let pa = VDSO_PAGE.ppn;
        let data = pa.get_mut::<VdsoData>();
        *pa.get_mut::<VdsoData>() = VdsoData::new();
        // &mut *data
        Arc::new(unsafe {UPIntrFreeCell::new(data)})
    };
}