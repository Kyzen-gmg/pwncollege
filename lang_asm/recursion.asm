section .text           ;must be declared for using gcc
    global _start

_start:                 ;tells linker entry point

    mov bx, 3           ;for calculating fact3
    call proc_fact
    add ax, 30h
    mov [fact], ax

    mov edx, len        ;msg len
    mov ecx, msg        ;msg to write
    mov ebx, 1          ;fd (stdout)
    mov eax, 4          ;syscall (syswriet)
    int 0x80            ;call kernel

    mov edx, 1          ;msg len
    mov ecx, fact       ;msg to write
    mov ebx, 1          ;fd (stdout)
    mov eax, 4          ;syscall (sys_write)
    int 0x80            ;call kernel

    mov eax, 1          ;syscall (sys_exit)
    int 0x80            ;call kernel

proc_fact:
    cmp bl, 1
    jg  do_calculation
    mov ax, 1
    ret

do_calculation:
    dec bl
    call proc_fact
    inc bl
    mul bl              ;ax = al * bl
    ret

section .data
msg db 'Factorial 3 is: ', 0xa
len equ $ - msg

section .bss
fact resb 1
