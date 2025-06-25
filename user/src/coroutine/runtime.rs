use alloc::{sync::Arc, vec::Vec};
use spin::Mutex;

use crate::thread_create;

use super::scheduler::{self, Scheduler};

// 协程运行时, 包含若干个线程, 每个线程有一个调度器
struct CoroutineRuntime {
    thread_num: usize,
    schedulers: Vec<(Arc<Mutex<Scheduler>>, usize)>,
}

fn scheduler_entry(scheduler: Arc<Mutex<Scheduler>>) {
    Scheduler::run(scheduler);
}

impl CoroutineRuntime {
    pub fn new(thread_num: usize) -> Self {
        let schedulers = (0..thread_num)
            .map(|i| {
                let scheduler = Arc::new(Mutex::new(Scheduler::new()));
                let thread_id = thread_create(scheduler_entry as usize, &scheduler as *const _ as usize);
                if thread_id < 0 {
                    panic!("Failed to create thread for scheduler{}", i);
                }
                (scheduler, thread_id as usize)
            })
            .collect();
        Self {
            thread_num,
            schedulers,
        }
    }

    
}