section .text
    global _start           ;must be declared for linker (gcc)

_start:                     ;tell linker entry point
    mov edx, 1              ;msg len
    mov ecx, choice         ;msg to write
    mov ebx, 1              ;file descriptor (stdout)
    mov eax, 4              ;syscall (sys_write)
    int 0x80                ;call kernel

    mov eax, 1              ;syscall (sys_exit)
    int 0x80                ;call kernel

section .data
choice DB 'y'