.altmacro
.macro SAVE_GP n
    sd x\n, \n*8(a0)
.endm
.macro LOAD_GP n
    ld x\n, \n*8(a1)
.endm
    .section .text
    .globl __switch_user
__switch_user:
    # __switch_user(
    #     current_trap_cx_ptr: *mut TrapContext, a0
    #     next_trap_cx_ptr: *const TrapContext, a1
    # )

    sd x1, 1*8(a0)  # save ra
    sd ra, 33*8(a0)  # save to sepc

    .set n, 2
    # save x2-x9
    .rept 8
        SAVE_GP %n
        .set n, n+1
    .endr

    .set n, 11
    # save x11-x31
    .rept 21
        SAVE_GP %n
        .set n, n+1
    .endr

    sd a0, 10*8(a0) # save current TrapContext pointer

    .set n, 2
    # restore x2-x10
    .rept 9
        LOAD_GP %n
        .set n, n+1
    .endr

    .set n, 12
    # restore x12-x31
    .rept 20
        LOAD_GP %n
        .set n, n+1
    .endr
    
    ld ra, 33*8(a1)  # load sepc to ra
    ld a1, 11*8(a1)

    ret
