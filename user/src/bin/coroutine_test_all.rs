#![no_std]
#![no_main]

use alloc::vec::Vec;
use user_lib::{
    event::create_event, exit, quit_coroutine_runtime, sleep_coro::coro_sleep, submit_coroutine, thread_create, wait_all_coroutines, waittid, yield_coro::coro_yield_once
};

#[macro_use]
extern crate user_lib;
extern crate alloc;

#[unsafe(no_mangle)]
pub fn main() -> i32 {
    const THREAD_NUM: usize = 3;

    let mut threads = Vec::with_capacity(THREAD_NUM);
    let mut ids = Vec::with_capacity(THREAD_NUM);

    for thread in 0..THREAD_NUM {
        ids.push(thread);

        let thread_id = thread_create(cor_task as usize, ids[thread]);
        threads.push(thread_id as usize);
        println!("THREAD {} created", thread);
    }
    println!("All threads created");

    for thread_id in threads {
        waittid(thread_id);
    }

    wait_all_coroutines();
    quit_coroutine_runtime();
    0
}

fn cor_task(thread_num: usize) {
    let c_event = create_event();
    let c_event_clone = c_event.clone();
    let coroutine_1 = async move {
        println!("THREAD {} coroutine 1 start", thread_num);
        c_event_clone.wait().await;
        println!("THREAD {} coroutine 1 end", thread_num);
    };
    let coroutine_2 = async move {
        println!("THREAD {} coroutine 2 start", thread_num);
        coro_sleep(3000).await;
        c_event.set();
        coro_yield_once().await;
        println!("THREAD {} coroutine 2 end", thread_num);
    };
    submit_coroutine(coroutine_1, thread_num);
    submit_coroutine(coroutine_2, thread_num + 1);
    exit(0);
}
