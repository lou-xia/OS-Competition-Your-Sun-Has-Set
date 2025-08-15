use core::{alloc::Layout, ptr::NonNull};

use alloc::{alloc::{AllocError, Allocator}, sync::Arc, vec::Vec};
use buddy_system_allocator::LockedHeap;

use crate::task_sched::task::TaskSched;

#[derive(Debug)]
pub struct TaskManager {
    pub ready_heap: Vec<Arc<TaskSched, LockedHeapAllocator>, LockedHeapAllocator>, // 就绪任务堆, 大根堆
}

impl TaskManager {
    pub fn len(&self) -> usize {
        self.ready_heap.len()
    }

    pub fn add(&mut self, task: Arc<TaskSched, LockedHeapAllocator>) {
        if !task.can_user_sched.load(core::sync::atomic::Ordering::SeqCst) {
            // 用户可调度的任务
            println!("add task which can not user sched: {:?}", task.id);
        }
        // task.clear_dynamic_priority();
        // 插入任务到堆中
        self.ready_heap.push(task);
        // 进行上滤操作
        let mut index = self.len() - 1;
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
        if self.len() == 0 {
            return None; // 没有任务可调度
        } else if self.len() == 1 {
            let task = self.ready_heap.pop();
            return task; // 只有一个任务, 直接弹出
        }
        // 取出堆顶任务, 同时将最后一个任务放到堆顶
        let task = self.ready_heap.swap_remove(0);
        task.clear_dynamic_priority();
        // println!("fetch task: {:?} dynamic prio={}", task.id, task.get_dynamic_prio());
        // 老化
        for task in self.ready_heap.iter() {
            task.add_dynamic_priority(1);
        }
        // 下滤操作
        let mut index = 0;
        while index < self.len() {
            let left_child = 2 * index + 1;
            let right_child = 2 * index + 2;
            let mut largest = index;

            if left_child < self.len() && self.ready_heap[left_child] > self.ready_heap[largest] {
                largest = left_child;
            }
            if right_child < self.len() && self.ready_heap[right_child] > self.ready_heap[largest] {
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
        Some(task)

    }

    #[inline(always)]
    pub fn peek(&self) -> Option<&Arc<TaskSched, LockedHeapAllocator>> {
        // for i in 0..self.len() {
        //     if self.ready_heap[i].can_user_sched.load(core::sync::atomic::Ordering::SeqCst) {
        //         return Some(&self.ready_heap[i]);
        //     }
        // }
        // None
        self.ready_heap.get(0)
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
