
use core::future::Future;
use core::pin::Pin;
use alloc::boxed::Box;
use alloc::sync::{Arc, Weak};
use alloc::vec::Vec;
use spin::Mutex;

use crate::coroutine::scheduler::Scheduler;

pub const MIN_PRIO: usize = 1;
pub const MAX_PRIO: usize = 20;
pub const DEFAULT_PRIO: usize = 10;

/// 协程定义
pub struct Coroutine {
    pub inner: Arc<CoroutineInner>,
}

pub struct CoroutineInner {
    pub future: Mutex<Pin<Box<dyn Future<Output = ()> + Send>>>,
    pub priority: usize,
    pub cid: usize,
    pub scheduler: Weak<Mutex<Scheduler>>
}

impl Coroutine {
    pub fn new(future: impl Future<Output = ()> + Send +'static, priority: usize, scheduler: &Arc<Mutex<Scheduler>>) -> Self {
        // TODO: allocate cid
        // let cid = CidAllocator.allocate_cid();
        let mut priority = priority;
        if priority < MIN_PRIO || priority > MAX_PRIO {
            println!("Priority must be between {} and {}, use default priority.", MIN_PRIO, MAX_PRIO);
            priority = DEFAULT_PRIO;
        }
        let cid = 0;
        let inner = CoroutineInner {
            future: Mutex::new(Box::pin(future)),
            priority,
            cid,
            scheduler: Arc::downgrade(&scheduler),
        };
        let inner = Arc::new(inner);
        Self { inner }
    }
}

impl PartialEq for Coroutine {
    fn eq(&self, other: &Self) -> bool {
        self.inner.priority == other.inner.priority
    }
}

impl Eq for Coroutine {}

impl PartialOrd for Coroutine {
    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
        Some(self.cmp(other))
    }
}

impl Ord for Coroutine {
    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
        self.inner.priority.cmp(&other.inner.priority)
    }
}

pub struct CidAllocator {
    current: usize,
    recycled: Vec<usize>,
}

impl CidAllocator {
    pub fn new() -> Self {
        CidAllocator {
            current: 0,
            recycled: Vec::new(),
        }
    }
    pub fn alloc(&mut self) -> usize {
        if let Some(id) = self.recycled.pop() {
            id
        } else {
            self.current += 1;
            self.current - 1
        }
    }
    pub fn dealloc(&mut self, id: usize) {
        assert!(id < self.current);
        assert!(
            !self.recycled.iter().any(|i| *i == id),
            "id {} has been deallocated!",
            id
        );
        self.recycled.push(id);
    }
}