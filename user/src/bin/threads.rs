#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;
extern crate alloc;

use alloc::vec;
use user_lib::{exit, thread_create, waittid, yield_};

pub fn thread_a() -> ! {
    for _ in 0..1000 {
        print!("a");
        yield_();
    }
    exit(1)
}

pub fn thread_b() -> ! {
    for _ in 0..1000 {
        print!("b");
        yield_();
    }
    exit(2)
}

pub fn thread_c() -> ! {
    for _ in 0..1000 {
        print!("c");
        yield_();
    }
    exit(3)
}

#[unsafe(no_mangle)]
pub fn main() -> i32 {
    let v = vec![
        thread_create(thread_a as usize, 0),
        thread_create(thread_b as usize, 0),
        thread_create(thread_c as usize, 0),
    ];
    for tid in v.iter() {
        let exit_code = waittid(*tid as usize);
        println!("thread#{} exited with code {}", tid, exit_code);
    }
    println!("main thread exited.");
    0
}
