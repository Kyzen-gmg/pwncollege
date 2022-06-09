section .text
    global _start       ;must be declared for linker (ld)

_start:                 ;tells linker entry point
    mov edx,len         ;message length
    mov ecx,msg     ;message to write
    mov ebx,1           ;file descriptor (stdout)
    mov eax,4           ;syscall number (sys_write)
    int 0x80            ;call kernel

    mov eax,1           ;syscall number (sys_exit)
    int 0x80            ;call kernel

section .data
msg db 'Hello, world!', 0xa     ;string to be printed
len equ $ - msg         ;length of the string

;nasm -f elf hello.asm
;ld -m elf_i386 -s -o hello hello.o