use core::{alloc::Layout, ptr::NonNull, sync::atomic::Ordering};

use alloc::{alloc::{AllocError, Allocator}, sync::Arc, vec::Vec};
use buddy_system_allocator::LockedHeap;

use crate::task_sched::task::TaskSched;

#[derive(Debug)]
pub struct TaskManager {
    pub ready_heap: [Arc<TaskSched, LockedHeapAllocator>; 128], // 使用数组代替VecDeque, 目前最大128
    size: usize, // 当前队列大小
    empty: Arc<TaskSched, LockedHeapAllocator>, // 占位用
}

impl TaskManager {
    pub fn add(&mut self, task: Arc<TaskSched, LockedHeapAllocator>) {
        if self.size >= self.ready_heap.len() {
            panic!("TaskManager is full, cannot add more tasks");
        }
        // 插入任务到堆中
        self.ready_heap[self.size] = task;
        self.size += 1;
        // 进行上滤操作
        let mut index = self.size - 1;
        while index > 0 {
            let parent_index = (index - 1) / 2;
            if self.ready_heap[index] > self.ready_heap[parent_index] {
                // 交换, 内联函数
                self.ready_heap.swap(index, parent_index);
                index = parent_index;
            } else {
                break;
            }
        }
    }

    pub fn fetch(&mut self) -> Option<Arc<TaskSched, LockedHeapAllocator>> {
        let mut unsched_vec = Vec::new();
        loop {
            if self.size == 0 {
                for t in unsched_vec {
                    self.add(t);
                }
                return None; // 没有任务可调度
            }
            // 取出堆顶任务
            let task = self.ready_heap[0].clone();
            // println!("fetch task: {:?} dynamic prio={}", task.id, task.get_dynamic_prio());
            // 将最后一个任务放到堆顶
            self.size -= 1;
            if self.size > 0 {
                self.ready_heap[0] = self.ready_heap[self.size].clone();
                self.ready_heap[self.size] = self.empty.clone();
                // 老化
                for i in 0..self.size {
                    let mut inner = self.ready_heap[i].inner_exclusive_access();
                    inner.aging += 1;
                }
                // 下滤操作
                let mut index = 0;
                while index < self.size {
                    let left_child = 2 * index + 1;
                    let right_child = 2 * index + 2;
                    let mut largest = index;

                    if left_child < self.size && self.ready_heap[left_child] > self.ready_heap[largest] {
                        largest = left_child;
                    }
                    if right_child < self.size && self.ready_heap[right_child] > self.ready_heap[largest] {
                        largest = right_child;
                    }
                    if largest != index {
                        // 交换, 内联函数
                        self.ready_heap.swap(index, largest);
                        index = largest;
                    } else {
                        break;
                    }
                }
            }
            // 如果用户可以调度
            if task.can_user_sched.load(Ordering::SeqCst) {
                task.inner_exclusive_access().aging = 0; // 重置老化
                // 重新插入之前不可调度的任务
                for t in unsched_vec {
                    self.add(t);
                }
                return Some(task);
            } else {
                unsched_vec.push(task);
            }
        }
        

    }

    pub fn peek(&self) -> Option<&Arc<TaskSched, LockedHeapAllocator>> {
        for i in 0..self.size {
            if self.ready_heap[i].can_user_sched.load(Ordering::SeqCst) {
                return Some(&self.ready_heap[i]);
            }
        }
        None
    }

    pub fn get_size(&self) -> usize {
        self.size
    }
}

#[derive(Clone, Copy)]
pub struct LockedHeapAllocator(&'static LockedHeap);

unsafe impl Allocator for LockedHeapAllocator {
    fn allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
        let mut heap = self.0.lock();
        let ptr = heap.alloc(layout).map_err(|_| AllocError)?;
        Ok(NonNull::slice_from_raw_parts(ptr, layout.size()))    
    }

    unsafe fn deallocate(&self, ptr: NonNull<u8>, layout: Layout) {
        let mut heap = self.0.lock();
        heap.dealloc(ptr, layout);
    }
}
