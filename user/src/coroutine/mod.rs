use core::future::Future;
use core::pin::Pin;
use core::task::Poll;
use alloc::sync::Arc;
use runtime::{quit_coroutine_runtime, submit_coroutine, wait_all_coroutines};
use spin::Mutex;

use crate::coroutine::scheduler::Scheduler;

pub mod coroutine;
pub mod scheduler;
mod runtime;


#[allow(unused)]
pub fn test_for_coroutine() {
    let scheduler = Arc::new(Mutex::new(Scheduler::new()));
    // let weak_scheduler: Weak<Mutex<Scheduler>> = Arc::downgrade(&scheduler);

    // 创建第一个协程
    let future1 = async {
        for i in 0..3 {
            println!("[Task 1] running: {}", i);
            dummy_yield().await;
        }
    };

    // 创建第二个协程
    let future2 = async {
        for i in 0..3 {
            println!("[Task 2] running: {}", i);
            dummy_yield().await;
        }
    };

    // // 创建并加入调度器
    // let coro1 = Coroutine::new(Box::pin(future1), 1,  &scheduler.clone());
    // let coro2 = Coroutine::new(Box::pin(future2), 2,  &scheduler.clone());

    // scheduler.lock().submit(coro1.into());
    // scheduler.lock().submit(coro2.into());

    // // 启动调度器
    // start_scheduler(scheduler.clone());
    // // Scheduler::run(scheduler.clone());

    submit_coroutine(future1, 1);
    submit_coroutine(future2, 2);

    wait_all_coroutines();
    quit_coroutine_runtime();

}

fn dummy_yield() -> impl Future<Output = ()> {
    struct YieldOnce(bool);

    impl Future for YieldOnce {
        type Output = ();

        fn poll(mut self: Pin<&mut Self>, cx: &mut core::task::Context<'_>) -> core::task::Poll<Self::Output> {
            if self.0 == true {
                Poll::Ready(())
            } else {
                self.0 = true;
                cx.waker().wake_by_ref();
                Poll::Pending
            }
        }
    }

    YieldOnce(false)
}