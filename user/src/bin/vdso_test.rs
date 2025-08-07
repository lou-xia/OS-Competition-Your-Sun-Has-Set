#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;
use user_lib::sleep;

pub struct VdsoData {
    pub num: usize,
}

#[unsafe(no_mangle)]
pub fn main() -> i32 {
    sleep(66);
    unsafe {
        let data: *const VdsoData = (usize::MAX - 256 * 0x4000_0000 + 1) as *const _;
        println!("data: {:p}", data);
    }
    0
}
