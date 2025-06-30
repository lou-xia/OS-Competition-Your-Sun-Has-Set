# proj146 基于rCore的优先级协程、线程、进程统一调度系统

[![rCore-Tutorial-v3](https://img.shields.io/badge/based%20on-rCore-blue)](https://github.com/rcore-os/rCore-Tutorial-v3)
[![Rust](https://img.shields.io/badge/language-Rust-orange)](https://www.rust-lang.org/)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## 项目简介

本项目基于 [rCore](https://github.com/rcore-os/rCore) 操作系统，实现了支持优先级的协程、线程、进程统一调度系统。项目探索了如何在操作系统层面统一管理不同粒度的执行单元，为高并发应用提供了新的解决方案。

### 核心特性

- **用户态协程系统**：基于Rust Future的异步协程运行时，支持多线程并行调度
- **优先级统一调度**：1-20级优先级调度框架，协程、线程、进程统一管理
- **跨层优先级传递**：协程优先级通过系统调用影响内核调度决策
- **高性能调度算法**：BTreeSet实现O(log n)调度，老化机制防饥饿

## 技术架构

```
用户态: CoroutineRuntime → Scheduler → Event同步
          ↓ sys_thread_prio()
内核态: TaskManager → BTreeSet优先级队列 → 老化机制
```

### 主要组件

- **CoroutineRuntime**: 协程运行时，管理4个工作线程
- **Scheduler**: 协程调度器，BinaryHeap优先级调度
- **TaskManager**: 内核任务管理器，BTreeSet优先级调度
- **Event**: 协程间同步原语

## 快速开始

### 构建项目

```bash
# 克隆项目
git clone <repository-url>
cd OS-Competition-Your-Sun-Has-Set

# 构建内核
cd os
make build

# 运行系统
make run
```

### 协程使用示例

```rust
use crate::coroutine::*;

// 创建协程
let future = async {
    println!("Hello from coroutine!");
};

// 提交协程（优先级为10）
submit_coroutine(future, 10);

// 等待所有协程完成
wait_all_coroutines();
// 退出协程运行时
quit_coroutine_runtime();
```

## 项目结构

```
├── os/                     # 内核代码
│   ├── src/task/          # 任务管理模块
│   └── src/syscall/       # 系统调用
├── user/                  # 用户程序
│   └── src/coroutine/     # 协程系统
|   └── src/coroutine_lib/ # 协程子功能
└── report.md              # 详细技术报告
```

## 详细文档

- **[技术报告](./report.md)**: 完整的系统设计、实现细节和测试结果
- **[开发日志](#开发日志)**: 项目开发过程记录

## 开发日志

- **2025.6.9**: 实现用户态协程定义与基础调度，BinaryHeap优先级队列
- **2025.6.15**: 完成多线程协程运行时架构
- **2025.6.20**: 实现内核BTreeSet优先级调度替换轮转调度
- **2025.6.25**: 完成跨层优先级传递机制
- **2025.6.30**: 系统整合测试，文档完善

## 技术贡献

1. **创新的协程-线程统一调度架构**
2. **高效的跨层优先级传递机制**
3. **基于Future的轻量级协程实现**
4. **动态优先级调度算法**

## 致谢

- 感谢 [rCore项目](https://github.com/rcore-os/rCore) 提供的优秀操作系统基础
- 感谢Rust异步生态系统的支持

## 许可证

本项目遵循 GPL 3.0 开源许可证。

---

*关于项目的详细技术实现，请参阅 [技术报告](./report.md)*