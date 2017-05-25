.intel_syntax noprefix
Usage:
    .asciz "Usage: %s"

.balign 16
.globl main
main:
    push rbp
    cmp edi, 3
    jne ExitUsage


    ret

.balign 8
ExitUsage:
    mov rsi, [rsi]
    mov rdi, OFFSET Usage
    call printf
    mov eax, 1
    ret


