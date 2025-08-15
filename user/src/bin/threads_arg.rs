#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;
extern crate alloc;

use alloc::vec::Vec;
use user_lib::{exit, get_time, thread_create, waittid, yield_};

struct Argument {
    pub ch: char,
    pub rc: i32,
}

fn thread_print(arg: *const Argument) -> ! {
    let arg = unsafe { &*arg };
    for _ in 0..1000 {
        print!("{}", arg.ch);
        yield_();
    }
    exit(arg.rc)
}

#[unsafe(no_mangle)]
pub fn main() -> i32 {
    let mut v = Vec::new();
    let args = [
        Argument { ch: 'a', rc: 1 },
        Argument { ch: 'b', rc: 2 },
        Argument { ch: 'c', rc: 3 },
    ];
    let start = get_time() as usize;
    for arg in args.iter() {
        v.push(thread_create(
            thread_print as usize,
            arg as *const _ as usize,
        ));
    }
    for tid in v.iter() {
        let exit_code = waittid(*tid as usize);
        println!("thread#{} exited with code {}", tid, exit_code);
    }
    let end = get_time() as usize;
    println!("Total time: {} ms", end - start);
    println!("main thread exited.");
    0
}
