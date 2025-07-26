use core::{pin::Pin, task::Poll};

use crate::get_time;

pub struct SleepFuture {
    duration: usize,
    start_time: usize,
}

impl SleepFuture {
    pub fn new(duration: usize) -> Self {
        Self {
            duration,
            start_time: get_time() as usize,
        }
    }
}

impl Future for SleepFuture {
    type Output = ();

    fn poll(self: Pin<&mut Self>, cx: &mut core::task::Context<'_>) -> Poll<Self::Output> {
        let elapsed = get_time() as usize - self.start_time;
        if elapsed >= self.duration {
            Poll::Ready(())
        } else {
            cx.waker().wake_by_ref();
            Poll::Pending
        }
    }
}

pub fn coro_sleep(duration: usize) -> SleepFuture {
    SleepFuture::new(duration)
}