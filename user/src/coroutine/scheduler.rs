use crate::{coroutine::{coroutine::{Coroutine, CoroutineInner}, runtime::remove_task}, thread_prio, yield_};
use alloc::{collections::binary_heap::BinaryHeap, sync::Arc, vec::Vec};
use core::task::{Context, Poll, RawWaker, RawWakerVTable, Waker};
use spin::Mutex;

use super::coroutine::{MAX_PRIO, MIN_PRIO};

pub struct Scheduler {
    pub id: usize, // 调度器的唯一标识符
    pub queue: BinaryHeap<Arc<Coroutine>>,
    pub pending_tasks: Vec<Arc<Coroutine>>,
    pub thread_id: usize, // 线程ID
    prio_dict: [u8; MAX_PRIO + 1], // 优先级字典
    pub max_prio: usize, // 当前最大优先级
    quitting: bool,
}

impl Scheduler {
    pub fn new(id: usize) -> Self {
        Self {
            id,
            queue: BinaryHeap::new(),
            pending_tasks: Vec::new(),
            thread_id: 0, // 线程ID可以在创建时设置
            prio_dict: [0; MAX_PRIO + 1], // 初始化优先级字典
            max_prio: MIN_PRIO, // 初始最大优先级为最小值
            quitting: false,
        }
    }

    fn spawn(&mut self, coroutine: Arc<Coroutine>) {
        self.queue.push(coroutine);
    }

    fn submit(&mut self, coroutine: Arc<Coroutine>) {
        self.pending_tasks.push(coroutine);
    }

    pub fn submit_coroutine(&mut self, coroutine: Arc<Coroutine>) {
        // 更新优先级字典
        let priority = coroutine.inner.priority;
        if priority > self.max_prio {
            self.max_prio = priority;

            thread_prio(priority as usize); // 设置线程的优先级
        }
        self.prio_dict[priority] += 1;
        self.pending_tasks.push(coroutine);

    }

    pub fn run(scheduler: Arc<Mutex<Self>>) {
        loop {
            let mut sched = scheduler.lock();
            // println!("Scheduler {} running", sched.id);
            // 如果正在退出，则不再调度
            if sched.quitting {
                // println!("Scheduler {} is quitting", sched.id);
                drop(sched);
                break;
            }
            while let Some(pending) = sched.pending_tasks.pop() {
                sched.spawn(pending);
            }
            let coroutine = sched.queue.pop();
            drop(sched);

            let Some(coroutine) = coroutine 
              else { 
                yield_(); // 如果没有任务，则让出CPU
                continue;
            };
            // TODO: 应该打印的是cid，而不是priority，由于目前CidAllocator还没有实现，先用priority调试
            // println!("coroutine {} running", coroutine.inner.priority);

            let inner = coroutine.inner.clone();
            let waker = create_waker(inner.clone());
            let mut ctx = core::task::Context::from_waker(&waker);
            let mut future = inner.future.lock();

            if let core::task::Poll::Pending = future.as_mut().poll(&mut ctx) {
                // 如果未完成，再加入任务队列
                let mut sched = scheduler.lock();
                sched.submit(coroutine);
            } else {
                // 减少优先级字典
                let mut sched = scheduler.lock();
                sched.prio_dict[inner.priority] -= 1;
                if sched.prio_dict[inner.priority] == 0 && inner.priority == sched.max_prio {
                    // 如果该优先级的任务数为0，更新最大优先级
                    
                    sched.max_prio = (MIN_PRIO..=MAX_PRIO)
                        .rev()
                        .find(|&p| sched.prio_dict[p] > 0)
                        .unwrap_or(MIN_PRIO);
                    
                    thread_prio(sched.max_prio); // 更新线程优先级
                }
                // 如果完成了，减少剩余任务数
                remove_task();
            }
        }
    }

    #[allow(dead_code)]
    pub fn step(&mut self) {
        if let Some(coroutine) = self.queue.pop() {
            // TODO: 应该打印的是cid，而不是priority，由于目前CidAllocator还没有实现，先用priority调试
            // println!("coroutine {} running", coroutine.inner.priority);

            let inner = coroutine.inner.clone();
            let waker = create_waker(inner.clone());
            let mut ctx = Context::from_waker(&waker);
            let mut future = inner.future.lock();
            if let Poll::Pending = future.as_mut().poll(&mut ctx) {
                self.spawn(coroutine);
            }
            while let Some(pending) = self.pending_tasks.pop() {
                self.spawn(pending);
            }
        }
    }

    // 返回当前调度器中的任务数量
    pub fn task_count(&self) -> usize {
        self.queue.len() + self.pending_tasks.len()
    }

    // 关闭调度器
    pub fn quit(&mut self) {
        self.quitting = true;
    }
}

fn clone_waker(data: *const ()) -> RawWaker {
    let arc = unsafe { Arc::<CoroutineInner>::from_raw(data as *const CoroutineInner) };
    let cloned = arc.clone();
    core::mem::forget(arc);
    RawWaker::new(Arc::into_raw(cloned) as *const (), &VTABLE)
}

fn wake(_data: *const ()) {}

// TODO：下面的代码是开发时用的，后来我在 scheduler 的 run 里又实现了一次，因此把这里注释
// 但是我感觉这些代码或许后面还有用，先留一下
// fn wake(data: *const ()) {
//     let inner = unsafe { Arc::<CoroutineInner>::from_raw(data as *const CoroutineInner) };
//     if let Some(sched) = inner.scheduler.upgrade() {
//         let coroutine = Arc::new(Coroutine {
//             inner: inner.clone(),
//         });
//         sched.lock().submit(coroutine);
//     }
//     core::mem::forget(inner);
// }

fn wake_by_ref(_data: *const ()) {}

fn drop_waker(data: *const ()) {
    unsafe {
        drop(Arc::<CoroutineInner>::from_raw(
            data as *const CoroutineInner,
        ))
    }
}

const VTABLE: RawWakerVTable = RawWakerVTable::new(clone_waker, wake, wake_by_ref, drop_waker);

pub fn create_waker(inner: Arc<CoroutineInner>) -> Waker {
    let raw = RawWaker::new(Arc::into_raw(inner) as *const (), &VTABLE);
    unsafe { Waker::from_raw(raw) }
}
