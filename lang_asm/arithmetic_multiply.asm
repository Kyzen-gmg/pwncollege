section .text
    global _start           ;must be declared to use gcc

_start:                     ;tells linker entry point

    mov al, '3'
    sub al, '0'

    mov bl, '2'
    sub bl, '0'

    mul bl
    add al, '0'

    ;stores result of mul
    mov [res], al

    ;prints msg
    mov ecx, msg
    mov edx, len
    mov ebx, 1              ;fd (stdout)
    mov eax, 4              ;sys call (sys_write)
    int 0x80                ;call kernel

    ;prints res
    mov ecx, res
    mov edx, 1
    mov ebx, 1              ;fd (stdout)
    mov eax, 4              ;sys call (sys_write)
    int 0x80                ;call kernel

    mov eax, 1              ;sys call (sys_exit)
    int 0x80                ;call kernel

section .data
msg db "The result is : ", 0xA, 0xD
len equ $- msg
segment .bss
res resb 1