use core::fmt::Debug;
use core::sync::atomic::{AtomicUsize, Ordering};
use core::cell::UnsafeCell;

pub struct TicketLock<T> {
    serve: AtomicUsize,    // 当前服务票号
    next: AtomicUsize,     // 下一个可用票号
    data: UnsafeCell<T>,   // 被保护的数据
}

unsafe impl<T: Sync> Sync for TicketLock<T> {}

impl<T> TicketLock<T> {
    pub const fn new(data: T) -> Self {
        Self {
            serve: AtomicUsize::new(0),
            next: AtomicUsize::new(0),
            data: UnsafeCell::new(data),
        }
    }

    pub fn lock(&self) -> TicketGuard<'_, T> {
        println!("About to fetch ticket...");
        // 获取票号（原子递增）
        let ticket = self.next.fetch_add(1, Ordering::Relaxed);
        println!("Got ticket: {}", ticket);
        
        while self.serve.load(Ordering::Acquire) != ticket {
            core::hint::spin_loop(); // 等待直到轮到当前票号
        }
        TicketGuard { lock: self }
    }

    pub unsafe fn force_unlock(&self) {
        // 服务下一个票号
        self.serve.fetch_add(1, Ordering::Release);
    }

    pub fn locked(&self) -> bool {
        self.serve.load(Ordering::Relaxed) != self.next.load(Ordering::Relaxed)
    }

    pub fn get_serve(&self) -> usize {
        self.serve.load(Ordering::SeqCst)
    }

    pub fn get_next(&self) -> usize {
        self.next.load(Ordering::SeqCst)
    }
}

impl<T: Debug> Debug for TicketLock<T> {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        f.debug_struct("TicketLock")
            .field("serve", &self.serve.load(Ordering::Relaxed))
            .field("next", &self.next.load(Ordering::Relaxed))
            .field("inner", unsafe {&*self.data.get()})
            .finish()
    }

    pub unsafe fn force_unlock(&self) {
        // 服务下一个票号
        self.serve.fetch_add(1, Ordering::Release);
    }

    pub fn locked(&self) -> bool {
        self.serve.load(Ordering::Relaxed) != self.next.load(Ordering::Relaxed)
    }

    pub fn get_serve(&self) -> usize {
        self.serve.load(Ordering::SeqCst)
    }

    pub fn get_next(&self) -> usize {
        self.next.load(Ordering::SeqCst)
    }
}

impl<T: Debug> Debug for TicketLock<T> {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        f.debug_struct("TicketLock")
            .field("serve", &self.serve.load(Ordering::Relaxed))
            .field("next", &self.next.load(Ordering::Relaxed))
            .field("inner", unsafe {&*self.data.get()})
            .finish()
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