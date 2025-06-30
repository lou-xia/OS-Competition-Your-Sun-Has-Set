#![no_std]
#![no_main]

use user_lib::{
    quit_coroutine_runtime,
    sleep_coro::coro_sleep,
    submit_coroutine,
    wait_all_coroutines,
};

#[macro_use]
extern crate user_lib;
extern crate alloc;

#[unsafe(no_mangle)]
pub fn main() -> i32 {
    let coro_num = 20;

    for i in 0..coro_num {
        let future = async move {
            println!("coroutine {} before sleep", i);
            coro_sleep(1000).await;
            println!("coroutine {} after sleep", i);
        };
        submit_coroutine(future, i + 1);
    }
    wait_all_coroutines();
    quit_coroutine_runtime();
    0
}
