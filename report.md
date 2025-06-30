# 基于rCore的优先级协程、线程、进程统一调度系统

## 1. 目标描述

本项目基于rCore操作系统，实现了一个支持优先级的协程、线程、进程统一调度系统。主要目标包括：

- **用户态协程系统**：实现基于Rust Future的异步协程运行时，支持多线程并行调度
- **优先级调度机制**：为协程、线程、进程提供统一的优先级调度框架（1-20级优先级）
- **统一调度架构**：将协程、线程、进程纳入统一的调度体系，实现高效的任务管理
- **事件同步机制**：提供协程间通信和同步原语，支持复杂的并发场景

## 2. 比赛题目分析和相关资料调研

### 2.1 题目分析
传统操作系统中，进程和线程是主要的执行单元，但随着异步编程和高并发需求的增长，协程作为轻量级的执行单元越来越重要。本项目旨在探索如何在操作系统层面统一管理这三种执行单元。

### 2.2 技术挑战
- **抽象层次差异**：协程运行在用户态，线程和进程运行在内核态
- **调度粒度问题**：协程调度频率远高于线程/进程调度
- **优先级传递**：如何将协程优先级传递到内核态调度器
- **性能开销**：统一调度可能带来的性能损失

### 2.3 相关技术调研
- **Rust异步生态**：基于Future trait的异步编程模型
- **rCore架构**：理解现有的进程/线程调度机制
- **协程实现**：研究Go goroutine、Kotlin coroutine等实现方案
- **优先级调度**：多级反馈队列、老化机制等经典算法

## 3. 系统框架设计

### 3.1 整体架构
```
用户态:
┌────────────────────────────────────┐
│ 协程系统 (User Coroutine System)    │
└──────────────────────┬─────────────┘
                       │
                       ▼ 依赖于
┌─────────────────────────────────────┐
│ 协程运行时 (Coroutine Runtime)       │
├─────────────────────────────────────┤
│ 多调度器 (Multiple Schedulers)       │
├─────────────────────────────────────┤
│ 事件同步 (Event Synchronization)     │
└─────────────────────────────────────┘
               │
               ▼ 系统调用
┌─────────────────────────────────────┐
│ 内核态线程/进程调度器                 │
├─────────────────────────────────────┤
│ 优先级任务管理器                     │
├─────────────────────────────────────┤
│ 老化机制防饥饿                       │
└─────────────────────────────────────┘
```

### 3.2 核心组件设计

#### 3.2.1 用户态协程系统
- **协程定义**：基于`Future trait`实现，对每个协程分配`CID`，支持1-20级优先级
- **协程调度器**：基于`Future`和`Wait`机制实现，对其调度的每个协程进行管理与排序(基于大根堆实现)。
- **运行时管理**：默认4个工作线程，每个线程运行独立调度器
- **负载均衡**：智能分配协程到任务数最少的调度器
- **生命周期管理**：支持协程创建、调度、完成、清理

#### 3.2.2 内核态调度器增强
- **统一优先级**：扩展TaskControlBlock支持动态优先级
- **BTreeSet调度队列**：使用平衡二叉树实现高效的优先级调度
- **老化机制**：防止低优先级任务饥饿
- **优先级继承**：协程优先级通过系统调用传递到线程

#### 3.2.3 事件同步机制
- **协程间通信**：使用`Event`实现协程间通信，通过不同协程对同一`event`实例操作实现同步。此外，`Event`机制可以实现异步通知机制。

## 4. 开发计划

### 第一阶段（已完成）：基础协程系统
- [x] 协程定义和基本调度
- [x] 多线程运行时架构
- [x] 事件同步机制
- [x] 基础测试用例

### 第二阶段（已完成）：内核调度器改进
- [x] 优先级调度算法
- [x] 老化机制实现
- [x] 系统调用扩展

### 第三阶段（已完成）：系统整合
- [x] 协程-线程优先级传递
- [x] 统一调度框架
- [x] 性能优化

### 第四阶段（进行中）：测试和优化
- [ ] 压力测试
- [ ] 性能分析
- [ ] 文档完善

## 5. 比赛过程中的重要进展

### 5.1 协程系统实现（2025.6.9）
实现了完整的用户态协程系统，包括：
- 基于Future的协程定义
- 多线程协程调度器
- 优先级队列调度算法
- 事件同步机制

### 5.2 内核调度器改进
将原有的简单轮转调度改进为基于优先级的调度：
- 使用BTreeSet实现O(log n)的插入和查找
- 实现老化机制防止饥饿
- 支持动态优先级调整

### 5.3 系统调用扩展
新增了多个系统调用支持协程-线程交互：
- `sys_thread_prio`: 动态调整线程优先级
- `sys_framebuffer`: 图形界面支持
- `sys_event_get`: 输入事件处理

## 6. 系统测试情况

### 6.1 功能测试
- **协程创建和调度**：测试协程的基本生命周期
- **优先级调度**：验证高优先级任务优先执行
- **事件同步**：测试协程间的等待和通知机制
- **负载均衡**：验证多调度器的任务分配

### 6.2 测试用例

- 总体测试：包括协程创建、调度等基本操作，验证协程的基本功能、事件同步与负载均衡。测试文件为`usr/bin/coroutine_test_all.rs`。  
测试结果：
```rust
>> coroutine_test_all
THREAD 0 created
THREAD 1 created
THREAD 2 created
All threads created
submit coroutine to scheduler 0
Priority must be between 1 and 20, use default priority.
submit coroutine to scheduler 1
submit coroutine to scheduler 2
submit coroutine to scheduler 3
submit coroutine to scheduler 0
submit coroutine to scheduler 1
THREAD 0 coroutine 1 start
THREAD 2 coroutine 2 start
THREAD 1 coroutine 1 start
THREAD 1 coroutine 2 start
THREAD 2 coroutine 2 end
THREAD 0 coroutine 2 start
THREAD 1 coroutine 2 end
THREAD 1 coroutine 1 end
THREAD 0 coroutine 2 end
THREAD 0 coroutine 1 end
THREAD 2 coroutine 1 start
THREAD 2 coroutine 1 end
Scheduler 3 is quitting
Scheduler 1 is quitting
Scheduler 0 is quitting
Scheduler 2 is quitting
```
可以看到，测试结果符合预期，协程调度、事件同步、负载均衡等功能都能正常运行。
- 优先级调度测试：测试不同优先级的协程调度顺序。测试文件为`usr/bin/coroutine_prior_test.rs`。  
测试结果：
```rust
>> coroutine_prior_test
submit coroutine to scheduler 0
submit coroutine to scheduler 1
submit coroutine to scheduler 2
submit coroutine to scheduler 3
submit coroutine to scheduler 0
submit coroutine to scheduler coroutine 4 before sleep
coroutine 2 before sleep
coroutine 3 before sleep
1
submit coroutine to scheduler 2
submit coroutine to scheduler 3
submit coroutine to scheduler 0
submit coroutine to scheduler 2
submit coroutine to scheduler 3
submit coroutine to scheduler 0
submit coroutine to scheduler 1
submit coroutine to scheduler 2
submit coroutine to scheduler 3
submit coroutine to scheduler 0
submit coroutine to scheduler 1
submit coroutine to scheduler 2
submit coroutine to scheduler 3
submit coroutine to scheduler 0
coroutine 19 before sleep
coroutine 16 before sleep
coroutine 17 before sleep
coroutine 18 before sleep
coroutine 16 after sleep
coroutine 12 before sleep
coroutine 19 after sleep
coroutine 15 before sleep
coroutine 17 after sleep
coroutine 13 before sleep
coroutine 18 after sleep
coroutine 14 before sleep
coroutine 15 after sleep
coroutine 11 before sleep
coroutine 12 after sleep
coroutine 5 before sleep
coroutine 13 after sleep
coroutine 9 before sleep
coroutine 14 after sleep
coroutine 10 before sleep
coroutine 5 after sleep
coroutine 1 before sleep
coroutine 11 after sleep
coroutine 8 before sleep
coroutine 9 after sleep
coroutine 6 before sleep
coroutine 10 after sleep
coroutine 7 before sleep
coroutine 1 after sleep
coroutine 8 after sleep
coroutine 4 after sleep
coroutine 0 before sleep
coroutine 6 after sleep
coroutine 2 after sleep
coroutine 7 after sleep
coroutine 3 after sleep
coroutine 0 after sleep
Scheduler 2 is quitting
Scheduler 3 is quitting
Scheduler 1 is quitting
Scheduler 0 is quitting
```
可以看到，不同优先级的协程调度顺序符合预期。
- 协程时钟中断测试：测试协程间的通信与同步，同时测试协程的时钟中断的功能。测试文件为`usr/bin/coroutine_test.rs`。  
测试结果：
```rust
>> coroutine_test         
submit coroutine to scheduler 0
[Coroutine] Waiting for timer interrupt...
[Coroutine] Timer interrupt received!
Scheduler 1 is quitting
Scheduler 2 is quitting
Scheduler 3 is quitting
Scheduler 0 is quitting
```
可以看到，协程间的通信和同步正常工作，协程的时钟中断也能正常工作。

## 7. 遇到的主要问题和解决方法

### 7.1 锁竞争问题
**问题**：协程与调度器的`Mutex`锁造成死锁。  
**解决方案**：减小锁的粒度，同时向上加一层封装，对其统一管理。


### 7.2 优先级反转
**问题**：低优先级协程可能阻塞高优先级协程  。
**解决方案**：协程优先级动态传递到线程调度器，避免优先级反转。

### 7.3 调试困难
**问题**：异步代码的调试和错误追踪困难，同时使用qeum时没有如同vscode一样方便的调试工具  。
**解决方案**：添加详细的日志输出，对每个可能出现问题的地方增加`println!`。

## 8. 分工和协作

### 8.1 项目分工
- 胡嘉晨：负责开发`CoroutineRuntime`模块，将包括协程的优先级调度加入内核调度器中，同时进行`Coroutine_lib`的开发。
- 肖嘉骏：负责开发`Coroutine`、`Scheduler`、`Event`模块，同时进行代码测试。

## 9. 提交仓库目录和文件描述

### 9.1 项目结构
```
OS-Competition-Your-Sun-Has-Set/
├── os/                          # 内核代码
│   ├── src/
│   │   ├── task/               # 任务管理模块
│   │   │   ├── manager.rs      # 优先级任务管理器
│   │   │   ├── id.rs          # 任务ID和优先级定义
│   │   │   └── ...
│   │   ├── syscall/           # 系统调用
│   │   │   ├── thread.rs      # 线程相关系统调用
│   │   │   └── ...
│   │   └── ...
├── user/                       # 用户程序
│   ├── src/
│   │   ├── coroutine/         # 协程系统
│   │   │   ├── mod.rs         # 模块入口和测试
│   │   │   ├── coroutine.rs   # 协程定义
│   │   │   ├── scheduler.rs   # 协程调度器
│   │   │   ├── runtime.rs     # 协程运行时
│   │   │   └── event.rs       # 事件同步机制
│   │   ├── coroutine_lib/     # 协程库
│   │   │   ├── mod.rs         # 模块入口
│   │   │   ├── timer.rs       # 协程时钟中断
│   │   │   ├── sleep_coro.rs  # 协程睡眠
│   │   │   └── yield_coro.rs  # 协程主动放弃执行
│   │   └── ...
├── easy-fs/                    # 文件系统
├── bootloader/                 # 引导程序
└── README.md                   # 项目说明
```

### 9.2 核心文件说明

#### 9.2.1 协程系统核心文件
- **`user/src/coroutine/coroutine.rs`**：协程定义，包含优先级管理和ID分配器
- **`user/src/coroutine/scheduler.rs`**：协程调度器，实现优先级调度和Waker机制
- **`user/src/coroutine/runtime.rs`**：协程运行时，管理多线程调度器
- **`user/src/coroutine/event.rs`**：事件同步，支持协程间通信

#### 9.2.2 内核调度系统
- **`os/src/task/manager.rs`**：任务管理器，实现基于BTreeSet的优先级调度
- **`os/src/task/id.rs`**：定义优先级常量和ID分配器
- **`os/src/syscall/thread.rs`**：线程相关系统调用，包括优先级设置

#### 9.2.3 用户协程库
- **`user/src/coroutine/mod.rs`**：包含协程系统测试用例
- **`user/src/coroutine_lib/mod.rs`**：包含协程库，包括协程时钟中断、协程睡眠、协程主动放弃执行等
- **`user/src/coroutine_lib/timer.rs`**：协程时钟中断，实现协程间通信和同步
- **`user/src/coroutine_lib/sleep_coro.rs`**：协程睡眠，实现协程间通信和同步
- **`user/src/coroutine_lib/yield_coro.rs`**：协程主动放弃执行，实现协程间通信和同步

#### 9.2.4 测试文件
- **`user/src/coroutine_test.rs`**：协程系统测试用例
- **`user/src/coroutine_test_all.rs`**：协程系统测试用例，包含所有测试用例
- **`user/src/coroutine_prior_test.rs`**：优先级调度测试用例

## 10. 比赛收获

### 10.1 收获
通过这次比赛，我们学到了很多知识。我们又一次的从代码上学习了操作系统的前沿知识，同时对Rust异步编程、协程概念、线程调度等概念有了很深刻的理解（太深刻啦！！！）。  
在这次比赛中，我们也收获了很多。我们增加了在`no_std`环境的开发经验，对操作系统底层的原理有了更加深入的了解。

### 10.2 改进方向
- 异步系统调用：`Event`机制可以用于实现协程的异步通知机制，可以尝试通过共享缓冲区等方法实现，然后用`Event`进行消息同步。
- 协程库：协程库可以扩展更多的功能，方便用户代码的编写。
- 性能优化：调度器的性能可以进一步优化，提升调度效率。
---

*本项目展示了现代操作系统中协程、线程、进程统一调度的可能性，为高并发应用提供了新的解决方案。*