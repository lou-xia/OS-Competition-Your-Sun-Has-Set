#![no_std]
#![no_main]

use user_lib::{event::create_event, quit_coroutine_runtime, submit_coroutine, timer::start_timer_interrupt, wait_all_coroutines};

#[macro_use]
extern crate user_lib;
extern crate alloc;

#[unsafe(no_mangle)]
pub fn main() -> i32 {
    let timer_event = create_event();
    let timer_event_clone = timer_event.clone();
    let timer_future = async move {
        println!("[Coroutine] Waiting for timer interrupt...");
        timer_event_clone.wait().await;
        println!("[Coroutine] Timer interrupt received!");
    };

    // 后台线程启动时钟中断定时，唤醒协程
    start_timer_interrupt(timer_event, 3000);

    submit_coroutine(timer_future, 1);

    wait_all_coroutines();
    quit_coroutine_runtime();
    0
}
