use alloc::{boxed::Box, sync::Arc};

use crate::{coroutine::event::Event, exit, sleep, thread_create};

pub fn start_timer_interrupt(event: Arc<Event>, interval: usize) {
    thread_create(
        timer_thread as usize,
        Box::into_raw(Box::new((event, interval))) as usize,
    );
}

extern "C" fn timer_thread(arg: usize) -> ! {
    let (event, interval): (Arc<Event>, usize) = *unsafe { Box::from_raw(arg as *mut _) };    
    sleep(interval);
    event.set();
    drop(event);
    exit(0);
}

