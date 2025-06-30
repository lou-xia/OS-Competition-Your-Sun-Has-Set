use core::future::Future;
use core::pin::Pin;
use core::task::Poll;

pub mod coroutine;
pub mod event;
pub mod runtime;
pub mod scheduler;

use alloc::sync::Arc;

pub use runtime::{quit_coroutine_runtime, submit_coroutine, wait_all_coroutines};
pub use event::Event;

#[allow(unused)]
pub fn test_for_coroutine() {
    // let scheduler = Arc::new(Mutex::new(Scheduler::new()));
    // let weak_scheduler: Weak<Mutex<Scheduler>> = Arc::downgrade(&scheduler);

    let event = Arc::new(Event::new());

    let event1 = event.clone();
    let future1 = async move {
        println!("[Task 1] waiting on event...");
        event1.wait().await;
        println!("[Task 1] event received!");
    };

    let event2 = event.clone();
    let future2 = async move {
        for i in 0..3 {
            println!("[Task 2] polling... round {}", i);
            wait_one_yield().await;
        }
        println!("[Task 2] setting event");
        event2.set();
    };

    submit_coroutine(future1, 1);
    println!("[Task 1] submitted");

    submit_coroutine(future2, 2);
    println!("[Task 2] submitted");

    wait_all_coroutines();

    println!("All tasks completed, exiting runtime.");

    quit_coroutine_runtime();
}

fn wait_one_yield() -> impl Future<Output = ()> {
    struct YieldOnce(bool);

    impl Future for YieldOnce {
        type Output = ();

        fn poll(
            mut self: Pin<&mut Self>,
            cx: &mut core::task::Context<'_>,
        ) -> core::task::Poll<Self::Output> {
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
