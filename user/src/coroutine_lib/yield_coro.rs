use core::{pin::Pin, sync::atomic::{AtomicUsize, Ordering}, task::Poll};

pub struct YieldFuture {
    times: usize,
    passed: AtomicUsize,
}

impl YieldFuture {
    pub fn new(times: usize) -> Self {
        Self {
            times,
            passed: AtomicUsize::new(0),
        }
    }
}

impl Future for YieldFuture {
    type Output = ();

    fn poll(self: Pin<&mut Self>, cx: &mut core::task::Context<'_>) -> Poll<Self::Output> {
        if self.passed.load(Ordering::SeqCst) < self.times {
            self.passed.fetch_add(1, Ordering::SeqCst);
            cx.waker().wake_by_ref();
            Poll::Pending
        } else {
            Poll::Ready(())
        }
    }
}

pub fn coro_yield_once() -> YieldFuture {
    YieldFuture::new(1)
}

pub fn coro_yield(times: usize) -> YieldFuture {
    YieldFuture::new(times)
}