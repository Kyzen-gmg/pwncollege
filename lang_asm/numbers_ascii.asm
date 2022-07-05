section .text
    global _start           ;must be declared for using gcc

_start:                     ;tells linker entry point
    sub ah, ah
    mov al, '9'
    sub al, '3'
    aas
    or  al, 30h
    mov [res], ax

    mov edx, len             ;msg len
    mov ecx, msg            ;msg to write
    mov ebx, 1              ;fd (stdout)
    mov eax, 4              ;syscall number(sys_write)
    int 0x80                ;call kernel

    mov edx, 1              ;msg len
    mov ecx, res            ;msg to write
    mov ebx, 1              ;fd (stdout)
    mov eax, 4              ;syscall number (sys_write)
    int 0x80                ;call kernel

    mov eax, 1              ;syscall number (sys_exit)
    int 0x80                ;call kernel

section .data
msg db 'The Result is:', 0xa
len equ $ - msg
section .bss
res resb 1
