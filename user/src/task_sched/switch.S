.altmacro
.macro SAVE_SN n
    sd s\n, (\n+2)*8(a0)
.endm
.macro LOAD_SN n
    ld s\n, (\n+2)*8(a1)
.endm
    .section .text
    .globl __switch_user
    .globl __return_place
__switch_user:
    # __switch_user(
    #     current_task_cx_ptr: *mut TaskContext,
    #     next_task_cx_ptr: *const TaskContext
    # )
    # save user stack of current task
    sd sp, 120(a0)
    # save ra & s0~s11 of current execution
    sd ra, 112(a0)
    .set n, 0
    .rept 12
        SAVE_SN %n
        .set n, n + 1
    .endr
    # restore ra & s0~s11 of next execution
    ld ra, 112(a1)
    .set n, 0
    .rept 12
        LOAD_SN %n
        .set n, n + 1
    .endr
    # restore user stack of next task
    ld sp, 120(a1)
    # 跳转，不使用call
    la t0, user_schedule_unlock
    jr t0
__return_place:
    jr ra
