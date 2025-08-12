mod context;

use crate::config::{PAGE_SIZE, TRAMPOLINE};
use crate::mm::{translated_ref, translated_refmut};
use crate::syscall::syscall;
use crate::task::{
    check_signals_of_current, current_add_signal, current_trap_cx, current_trap_cx_user_va, current_user_token, exit_current_and_run_next, suspend_current_and_run_next, SignalFlags
};
use crate::timer::{check_timer, set_next_trigger};
use crate::vdso::vdso::VDSO_DATA;
use core::arch::{asm, global_asm};
use riscv::register::{
    mtvec::TrapMode,
    scause::{self, Exception, Interrupt, Trap},
    sie, sscratch, sstatus, stval, stvec,
};

#[unsafe(no_mangle)]
pub static TRAP_CONTEXT_PTR: usize = TRAMPOLINE - PAGE_SIZE; // 指向当前任务trap context的指针

global_asm!(include_str!("trap.S"));

pub fn init() {
    set_kernel_trap_entry();
}

fn set_kernel_trap_entry() {
    unsafe extern "C" {
        unsafe fn __alltraps();
        unsafe fn __alltraps_k();
    }
    let __alltraps_k_va = __alltraps_k as usize - __alltraps as usize + TRAMPOLINE;
    unsafe {
        stvec::write(__alltraps_k_va, TrapMode::Direct);
        sscratch::write(trap_from_kernel as usize);
    }
}

fn set_user_trap_entry() {
    unsafe {
        stvec::write(TRAMPOLINE as usize, TrapMode::Direct);
    }
}

pub fn enable_timer_interrupt() {
    unsafe {
        sie::set_stimer();
    }
}

fn enable_supervisor_interrupt() {
    unsafe {
        sstatus::set_sie();
    }
}

fn disable_supervisor_interrupt() {
    unsafe {
        sstatus::clear_sie();
    }
}

#[unsafe(no_mangle)]
pub fn print() {
    println!("print called");
}

#[unsafe(no_mangle)]
pub fn trap_handler() -> ! {
    // println!("[kernel] trap handler called");
    set_kernel_trap_entry();
    let scause = scause::read();
    let stval = stval::read();
    // println!("into {:?}", scause.cause());
    match scause.cause() {
        Trap::Exception(Exception::UserEnvCall) => {
            // jump to next instruction anyway
            let mut cx = current_trap_cx();
            cx.sepc += 4;
            current_task().unwrap().sched.inner_exclusive_access().task_cx.sepc = cx.sepc;
            // if current_task().unwrap().sched.id.0 != 0 && current_task().unwrap().sched.id.0 != 1 {
            //     println!("[kernel syscall1] tid: {}-{}, entry: {:#x}", current_task().unwrap().sched.id.0, current_task().unwrap().sched.id.1, cx.sepc);
            // }
            enable_supervisor_interrupt();

            // get system call return value
            let result = syscall(cx.x[17], [cx.x[10], cx.x[11], cx.x[12]]);
            // cx is changed during sys_exec, so we have to call it again
            cx = current_trap_cx();
            cx.x[10] = result as usize;
            // current_task().unwrap().sched.inner_exclusive_access().task_cx.sepc = cx.sepc;
        }
        Trap::Exception(Exception::StoreFault)
        | Trap::Exception(Exception::StorePageFault)
        | Trap::Exception(Exception::InstructionFault)
        | Trap::Exception(Exception::InstructionPageFault)
        | Trap::Exception(Exception::LoadFault)
        | Trap::Exception(Exception::LoadPageFault) => {
            // /*
            println!(
                "[kernel] {:?} in application, bad addr = {:#x?}, bad instruction = {:#x}, kernel killed it.",
                scause.cause(),
                stval,
                current_trap_cx().sepc,
            );
            // */
            current_add_signal(SignalFlags::SIGSEGV);
        }
        Trap::Exception(Exception::IllegalInstruction) => {
            println!(
                "[kernel] Illegal instruction in application, bad instruction = {:#x}, kernel killed it.",
                current_trap_cx().sepc,
            );
            current_add_signal(SignalFlags::SIGILL);
        }
        Trap::Interrupt(Interrupt::SupervisorTimer) => {
            set_next_trigger();
            // println!("timer interrupt");
            // 阻止内核抢占
            if !VDSO_DATA.exclusive_access().locked() {
                check_timer();
                // if current_task().unwrap().sched.id.0 != 0 && current_task().unwrap().sched.id.0 != 1 {
                //     println!("[kernel]time interrupt {}-{}", current_task().unwrap().sched.id.0, current_task().unwrap().sched.id.1);
                // }
                // current_task().unwrap().sched.inner_exclusive_access().task_cx.sepc = current_trap_cx().sepc;
                suspend_current_and_run_next();
                if current_task().unwrap().sched.id.0 != 0 { //&& current_task().unwrap().sched.id.0 != 1 {
                    println!("[kernel time interrupt2] tid: {}-{}, entry: {:#x}", current_task().unwrap().sched.id.0, current_task().unwrap().sched.id.1, current_trap_cx().sepc);
                }
                current_task().unwrap().sched.inner_exclusive_access().task_cx.sepc = current_trap_cx().sepc;
            }
        }
        Trap::Interrupt(Interrupt::SupervisorExternal) => {
            crate::board::irq_handler();
        }
        _ => {
            panic!(
                "Unsupported trap {:?}, stval = {:#x}!",
                scause.cause(),
                stval
            );
        }
    }
    // check signals
    if let Some((errno, msg)) = check_signals_of_current() {
        println!("[kernel] {}", msg);
        exit_current_and_run_next(errno);
    }
    trap_return();
}

#[unsafe(no_mangle)]
/// set the new addr of __restore asm function in TRAMPOLINE page,
/// set the reg a0 = trap_cx_ptr, reg a1 = phy addr of usr page table,
/// finally, jump to new addr of __restore asm function
pub fn trap_return() -> ! {
    disable_supervisor_interrupt();
    set_user_trap_entry();
    let trap_cx_user_va = current_trap_cx_user_va();
    let user_satp = current_user_token();
    // 更新TRAP_CONTEXT_PTR指向当前任务的trap context
    // *translated_refmut(user_satp, TRAP_CONTEXT_PTR as *mut usize) = trap_cx_user_va;

    // println!("[kernel] trap return");

    unsafe extern "C" {
        unsafe fn __alltraps();
        unsafe fn __restore();
    }
    let restore_va = __restore as usize - __alltraps as usize + TRAMPOLINE;
    // println!("before return");
    // println!("[kernel] trap return, trap_cx_va={:#x}", trap_cx_user_va);
    // println!("trap={:?}", translated_ref(user_satp, trap_cx_user_va as *const TrapContext));
    println!("restore_va={:#x}", restore_va);
    // println!("[kernel] task id: {}-{}", current_task().unwrap().sched.id.0, current_task().unwrap().sched.id.1);
    unsafe {
        asm!(
            "fence.i",
            "jr {restore_va}",
            restore_va = in(reg) restore_va,
            in("a0") trap_cx_user_va,
            in("a1") user_satp,
            options(noreturn)
        );
    }
}

#[unsafe(no_mangle)]
pub fn trap_from_kernel(_trap_cx: &TrapContext) {
    let scause = scause::read();
    let stval = stval::read();
    match scause.cause() {
        Trap::Interrupt(Interrupt::SupervisorExternal) => {
            crate::board::irq_handler();
        }
        Trap::Interrupt(Interrupt::SupervisorTimer) => {
            set_next_trigger();
            check_timer();
            // do not schedule now
        }
        _ => {
            panic!(
                "Unsupported trap from kernel: {:?}, stval = {:#x}!",
                scause.cause(),
                stval
            );
        }
    }
}

pub use context::TrapContext;
