section .text
    global _start           ;must be declared for linked (gcc)

_start:                     ;tell linker entry point
    mov edx,len             ;msg length
    mov ecx,msg             ;msg to write
    mov ebx,1               ;file descriptor (stdout)
    mov eax,4               ;system call number (sys_write)
    int 0x80                ;call kernel

    mov edx,9               ;msg length
    mov ecx,s2              ;msg to write
    mov ebx,1               ;file descriptor (stdout)
    mov eax,4               ;system call number (sys_write)
    int 0x80                ;call kernel

    mov eax,1               ;system call number (sys_exit)
    int 0x80                ;call kernel

section .data
msg db 'Displaying 9 stars',0xa ;a msg
len equ $ - msg                 ;len of msg
s2 times 9 db '*' 
