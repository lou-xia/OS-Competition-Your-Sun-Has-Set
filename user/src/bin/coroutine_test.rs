#![no_std]
#![no_main]

use user_lib::{
    quit_coroutine_runtime, submit_distribute_coroutine,
    wait_all_coroutines, yield_coro::{coro_yield, coro_yield_once},
};

#[macro_use]
extern crate user_lib;
extern crate alloc;

#[unsafe(no_mangle)]
pub fn main() -> i32 {

    async fn another_task() {
        println!("another task");
        coro_yield_once().await;
        println!("another task end");
    }

    async fn task() {
        println!("step 1");
        coro_yield_once().await;
        println!("step 2");
        coro_yield(3).await;
        println!("step 3");
    }

    submit_distribute_coroutine(task(), 1);
    submit_distribute_coroutine(another_task(), 1);

    wait_all_coroutines();
    quit_coroutine_runtime();
    println!("quit coroutine test");
    0
}
