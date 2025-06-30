use core::{sync::atomic::{AtomicBool, Ordering}, task::{Poll, Waker}};
use alloc::sync::Arc;
use spin::mutex::SpinMutex;

pub struct Event {
    pub ready: AtomicBool,
    pub waker: SpinMutex<Option<Waker>>
}

impl Event {
    pub fn new() -> Self {
        Self {
            ready: AtomicBool::new(false),
            waker: SpinMutex::new(None)
        }
    }

    pub fn set(&self) {
        self.ready.store(true, Ordering::SeqCst);
        if let Some(waker) = self.waker.lock().take() {
            waker.wake();
        }
    }

    pub fn clear(&self) {
        self.ready.store(false, Ordering::SeqCst);
    }

    pub fn wait(self: Arc<Self>) -> EventFuture {
        EventFuture { event: self }
    }
}

impl Drop for Event {
    fn drop(&mut self) {
        self.clear();
    }
}

pub struct EventFuture {
    event: Arc<Event>,
}

impl Future for EventFuture {
    type Output = ();

    fn poll(self: core::pin::Pin<&mut Self>, cx: &mut core::task::Context<'_>) -> core::task::Poll<Self::Output> {
        if self.event.ready.load(Ordering::SeqCst) {
            Poll::Ready(())
        } else {
            *self.event.waker.lock() = Some(cx.waker().clone());
            Poll::Pending
        }
    }
}

impl Drop for EventFuture {
    fn drop(&mut self) {
        self.event.clear();
    }
}

pub fn create_event() -> Arc<Event> {
    Arc::new(Event::new())
}
