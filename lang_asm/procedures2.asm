section .text           ;must be declared for using gcc
    global _start

_start:                 ;tells linker entry point
    call display
    mov eax, 1          ;syscall number (sys_exit)
    int 0x80            ;call kernel

display:
    mov ecx, 256

next:
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, achar
    mov edx, 1
    int 80h

    pop ecx
    mov dx, [achar]
    cmp byte [achar], 0dh
    inc byte [achar]
    loop next
    ret

section .data
achar db '0'
