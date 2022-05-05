; hello_world.asm
;
; Author:	kyzen
; Date:		20220505


global _start

section .text:
_start:
    mov eax, 0x4                ; use the write syscall
    mov ebx, 1                  ; use stdout as the fd
    mov ecx, message            ; use the message as the buffer
    mov edx, message_length     ; and supply the message_length
    int 0x80                    ; interrupt and invoke a syscall

    ; now gracefully exit

    mov eax, 0x1                ; exit
    mov ebx, 0
    int 0x80                    ; invoke syscall

section .data:
    message: db "Hello World!", 0xA
    message_length: equ $-message


; nasm -f elf32 -o hello_world.o hello_world.asm
; ld -m elf_i386 hello_world.o -o hello_world