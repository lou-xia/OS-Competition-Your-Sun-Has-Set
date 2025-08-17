#![no_std]
#![no_main]

use user_lib::{
    quit_coroutine_runtime, submit_distribute_coroutine,
    wait_all_coroutines, yield_coro::coro_yield_once,
};

#[macro_use]
extern crate user_lib;
extern crate alloc;

#[unsafe(no_mangle)]
pub fn main() -> i32 {

    for i in 0..10 {
        let task = async move {
            println!("task {}", i);
            coro_yield_once().await;
            println!("task {} end", i);
        };

        submit_distribute_coroutine(task, i / 2);
    }

    wait_all_coroutines();
    quit_coroutine_runtime();
    println!("quit coroutine test");
    0
}
