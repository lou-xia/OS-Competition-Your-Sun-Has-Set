use core::sync::atomic::{AtomicUsize, Ordering};
use core::cell::UnsafeCell;

pub struct TicketLock<T> {
    serve: AtomicUsize,    // 当前服务票号
    next: AtomicUsize,     // 下一个可用票号
    data: UnsafeCell<T>,   // 被保护的数据
}

unsafe impl<T: Send> Sync for TicketLock<T> {}

impl<T> TicketLock<T> {
    pub const fn new(data: T) -> Self {
        Self {
            serve: AtomicUsize::new(0),
            next: AtomicUsize::new(0),
            data: UnsafeCell::new(data),
        }
    }

    pub fn lock(&self) -> TicketGuard<'_, T> {
        // 获取票号（原子递增）
        let ticket = self.next.fetch_add(1, Ordering::Relaxed);
        
        // 等待直到轮到当前票号
        while self.serve.load(Ordering::Acquire) != ticket {
            core::hint::spin_loop(); // 自旋等待
        }
        
        TicketGuard { lock: self }
    }
}

pub struct TicketGuard<'a, T> {
    lock: &'a TicketLock<T>,
}

impl<T> Drop for TicketGuard<'_, T> {
    fn drop(&mut self) {
        // 服务下一个票号
        self.lock.serve.fetch_add(1, Ordering::Release);
    }
}

impl<T> core::ops::Deref for TicketGuard<'_, T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        unsafe { &*self.lock.data.get() }
    }
}

impl<T> core::ops::DerefMut for TicketGuard<'_, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { &mut *self.lock.data.get() }
    }
}