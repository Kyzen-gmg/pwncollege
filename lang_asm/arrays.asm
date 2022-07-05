section .text
    global _start           ;must be declared for linked (ld)

_start:                     ;tell linker entry point
    
    mov eax, 3              ;number bytes to be summed
    mov ebx, 0              ;EBX will store the sum
    mov ecx, x              ;ECX will point to the current element to be summed

top:    add ebx, [ecx]

    add ecx, 1              ;move pointer to next element
    dec eax                 ;decrement counter
    jnz top                 ;if counter not 0, then loop again

done:

    add ebx, '0'
    mov [sum], ebx          ;done, store result in sum

display:

    mov edx, 1              ;msg len
    mov ecx, sum            ;msg to write
    mov ebx, 1              ;fd (stdout)
    mov eax, 4              ;syscall (sys_write)
    int 0x80                ;call kernel

    mov eax, 1              ;syscall (sys_exit)
    int 0x80                ;call kernel

section .data
global x
x:
    db 2
    db 4
    db 3

sum:
    db 0
