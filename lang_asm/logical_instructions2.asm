section .text
    global _start           ;must be declared for using gcc

_start:                     ;tell linker entry point
    mov ax, 9h              ;getting 8 in the ax
    and ax, 1               ;and ax with 1
    jz  evnn
    mov eax, 4              ;sys call number (sys_write)
    mov ebx, 1              ;file descriptor (stdout)
    mov ecx, odd_msg        ;msg to write
    mov edx, len2           ;length of message
    int 0x80                ;call kernel
    jmp outprog

evnn:

    mov ah, 09h
    mov eax, 4              ;syscall number (sys_write)
    mov ebx, 1              ;file descriptor (stdout)
    mov ecx, even_msg       ;msg to wriet
    mov edx, len1           ;len of msg
    int 0x80                ;call kernel

outprog:

    mov eax, 1              ;syscall number (sys_exit)
    int 0x80                ;call kernel

section .data
even_msg db 'Even Number!'  ;msg showing even number
len1 equ $ - even_msg

odd_msg db 'Odd Number!'    ;msg showing odd number
len2 equ $ - odd_msg
