use alloc::{sync::Arc, vec::Vec};
use spin::Mutex;
use lazy_static::lazy_static;

use crate::thread_create;

use super::{coroutine::Coroutine, scheduler::{self, Scheduler}};

// 协程运行时的默认线程数
const DEFAULT_THREAD_NUM: usize = 4;

// 协程运行时, 包含多个线程, 每个线程有一个调度器
lazy_static! {
    static ref COROUTINE_RUNTIME: Mutex<CoroutineRuntime> = Mutex::new(CoroutineRuntime::new(DEFAULT_THREAD_NUM));
}

// 协程运行时, 包含若干个线程, 每个线程有一个调度器
struct CoroutineRuntime {
    thread_num: usize,
    schedulers: Vec<ThreadCoroutine>,
}

// 每个线程的协程调度器
struct ThreadCoroutine {
    thread_id: usize,
    scheduler: Arc<Mutex<Scheduler>>,
}

impl CoroutineRuntime {
    fn new(thread_num: usize) -> Self {
        let schedulers = (0..thread_num)
            .map(|i| {
                // 创建一个新的调度器
                let scheduler = Arc::new(Mutex::new(Scheduler::new()));
                // 创建一个新的线程来运行调度器
                let thread_id = thread_create(Self::scheduler_entry as usize, &scheduler as *const _ as usize);
                if thread_id < 0 {
                    panic!("Failed to create thread for scheduler{}", i);
                }
                ThreadCoroutine { thread_id: thread_id as usize, scheduler }
            })
            .collect();
        Self {
            thread_num,
            schedulers,
        }
    }
    
    // 启动协程运行时
    fn scheduler_entry(scheduler: Arc<Mutex<Scheduler>>) {
        Scheduler::run(scheduler);
    }

    // 提交协程到运行时
    fn submit(&mut self, future: impl Future<Output = ()> + Send + 'static, priority: usize) {
        // 选择剩余任务数最少的调度器
        let scheduler = self.schedulers.iter().min_by_key(|s| s.scheduler.lock().task_count()).unwrap();
        let coroutine = Arc::new(Coroutine::new(future, priority, &scheduler.scheduler));
        // 将协程提交到对应的调度器
        scheduler.scheduler.lock().submit(coroutine);
    }

}

// 提交协程到运行时
pub fn submit_coroutine(future: impl Future<Output = ()> + Send +'static, priority: usize) {
    let mut runtime = COROUTINE_RUNTIME.lock();
    runtime.submit(future, priority);
}

pub fn quit_coroutine_runtime() {
    let runtime = COROUTINE_RUNTIME.lock();
    for scheduler in &runtime.schedulers {
        scheduler.scheduler.lock().quit();
    }
}

pub fn wait_all_coroutines() {
    let runtime = COROUTINE_RUNTIME.lock();
    for scheduler in &runtime.schedulers {
        scheduler.scheduler.lock().wait();
    }
}