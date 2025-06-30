#![no_std]
#![no_main]

use alloc::{boxed::{self, Box}, sync::Arc, vec::Vec};
use lazy_static::*;
use user_lib::{
    coroutine, event::create_event, exit, quit_coroutine_runtime, submit_coroutine, thread_create, timer::{self, start_timer_interrupt}, wait_all_coroutines, waittid, Event
};

#[macro_use]
extern crate user_lib;
extern crate alloc;

lazy_static! {
    static ref TIMER_EVENT: Arc<Event> = create_event();
}

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

    start_timer_interrupt(TIMER_EVENT.clone(), 1000);
    // start_timer_interrupt(TIMER_EVENT.clone(), 3000);

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
    let timer_event_clone = TIMER_EVENT.clone();
    let coroutine_2 = async move {
        println!("THREAD {} coroutine 2 start", thread_num);
        timer_event_clone.wait().await;
        c_event.set();
        println!("THREAD {} coroutine 2 end", thread_num);
    };
    println!("11111111111111");
    submit_coroutine(coroutine_1, 2);
    submit_coroutine(coroutine_2, 1);
    println!("22222222222222");
    exit(0);
}
