section .text               ;must be declared for using gcc
    global _start

_start:                     ;tell linker entry point

    mov esi, 4              ;pointing to the rightmost digit
    mov ecx, 5              ;num of digits
    clc

add_loop:
    mov al, [num1 + esi]
    adc al, [num2 + esi]
    aaa
    pushf
    or al, 30h
    popf

    mov [sum + esi], al
    dec esi
    loop add_loop

    mov edx, len            ;msg len
    mov ecx, msg            ;msg to write
    mov ebx, 1              ;fd (stdout)
    mov eax, 4              ;syscall number (sys_write)
    int 0x80                ;call kernel

    mov edx, 5              ;msg len
    mov ecx, sum            ;msg to write
    mov ebx, 1              ;fd (stdout)
    mov eax, 4              ;syscall number (sys_write)
    int 0x80                ;call kernel

    mov eax, 1              ;syscall number (sys_exit)
    int 0x80                ;call kernel

section .data
msg db 'The Sum is:',0xa
len equ $ - msg
num1 db '12345'
num2 db '23456'
sum db '     ' 
