#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;
extern crate alloc;

use user_lib::test_for_coroutine;


#[unsafe(no_mangle)]
pub fn main() -> i32 {
    test_for_coroutine();
    0
}
