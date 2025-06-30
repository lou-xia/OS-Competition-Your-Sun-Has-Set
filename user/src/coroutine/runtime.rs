use alloc::{sync::Arc, vec::Vec};
use spin::Mutex;
use lazy_static::lazy_static;

use crate::{exit, gettid, thread_create, thread_prio, waittid, yield_};

use super::{coroutine::Coroutine, scheduler::Scheduler};

// 协程运行时的默认线程数
const DEFAULT_THREAD_NUM: usize = 4;

// 协程运行时, 包含多个线程, 每个线程有一个调度器
lazy_static! {
    static ref COROUTINE_RUNTIME: Mutex<CoroutineRuntime> = Mutex::new(CoroutineRuntime::new(DEFAULT_THREAD_NUM));
}

// 协程运行时, 包含若干个线程, 每个线程有一个调度器
pub struct CoroutineRuntime {
    #[allow(dead_code)]
    thread_num: usize,
    schedulers: Vec<Arc<Mutex<Scheduler>>>,
    threads: Vec<usize>, // 存储线程ID
    remaining_tasks: usize, // 用于跟踪剩余任务数
}


impl CoroutineRuntime {
    fn new(thread_num: usize) -> Self {

        let mut schedulers = Vec::with_capacity(thread_num);
        let mut threads = Vec::with_capacity(thread_num);
        
        for i in 0..thread_num {
            // println!("Creating scheduler {}", i);
            // 创建一个新的调度器
            let scheduler = Arc::new(Mutex::new(Scheduler::new(i)));
            let scheduler_clone = Arc::clone(&scheduler);
            // 创建一个新的线程, 并传入调度器的指针
            let thread_id = thread_create(
                CoroutineRuntime::scheduler_entry as usize,
                Arc::into_raw(scheduler_clone) as usize,
            );
            if thread_id < 0 {
                panic!("Failed to create thread for coroutine runtime");
            }
            // 将调度器和线程ID存储到对应的向量中
            schedulers.push(scheduler);
            threads.push(thread_id as usize);
        }

        Self {
            thread_num,
            schedulers,
            threads,
            remaining_tasks: 0
        }
    }
    
    // 启动协程运行时
    fn scheduler_entry(scheduler_ptr: usize) {
        // 从指针中获取调度器
        let scheduler: Arc<Mutex<Scheduler>> = unsafe { Arc::from_raw(scheduler_ptr as *const _) };
        let tid = gettid();
        let mut sched = scheduler.lock();
        sched.thread_id = tid as usize; // 设置线程ID
        // println!("Scheduler {} started with thread ID {}", sched.id, sched.thread_id);
        thread_prio(sched.max_prio);
        drop(sched);
        Scheduler::run(scheduler);
        exit(0); // 线程结束时退出
    }

    // 提交协程到运行时
    fn submit(&mut self, future: impl Future<Output = ()> + Send + 'static, priority: usize) {
        // 选择剩余任务数最少的调度器
        let scheduler = self.schedulers.iter().min_by_key(|s| s.lock().task_count()).unwrap();
        println!("submit coroutine to scheduler {}", scheduler.lock().id);
        let coroutine = Arc::new(Coroutine::new(future, priority, &scheduler));
        // 将协程提交到对应的调度器
        scheduler.lock().submit_coroutine(coroutine);
        self.remaining_tasks += 1;
    }

    pub fn remove_task(&mut self) {
        // 减少剩余任务数
        self.remaining_tasks -= 1;
    }

}

// 提交协程到运行时
pub fn submit_coroutine(future: impl Future<Output = ()> + Send +'static, priority: usize) {
    let mut runtime = COROUTINE_RUNTIME.lock();
    runtime.submit(future, priority);
}

pub fn remove_task() {
    let mut runtime = COROUTINE_RUNTIME.lock();
    runtime.remove_task();
}

pub fn quit_coroutine_runtime() {
    let runtime = COROUTINE_RUNTIME.lock();
    for scheduler in &runtime.schedulers {
        let mut sched = scheduler.lock();
        sched.quit(); // 关闭调度器
    }
    for thread_id in &runtime.threads {
        waittid(*thread_id); // 等待所有线程结束
    }
}

pub fn wait_all_coroutines() {
    loop {
        let runtime = COROUTINE_RUNTIME.lock();
        if runtime.remaining_tasks == 0 {
            drop(runtime); // 释放锁
            break; // 如果没有剩余任务，则退出循环
        } else {
            drop(runtime); // 释放锁
            yield_(); // 如果有剩余任务，则让出CPU
        }
    }

}