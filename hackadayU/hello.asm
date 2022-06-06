.LC0:
            .string     "Hello!"
            .text
            .globl      main
            .type       main, @function

main:
.LFB0:
            .cfi_startproc
            pushq       %rbp
            .cfi_def_cfa_offset 16
            .cif_offset 6, -16
            movq        %rsp, %rbp
            .cfi_def_cfa_register 6
            movl        $.LC0, %edi
            movl        $0, %eax
            call        printf
            movl        $0, %eax
            popq        %rbp
            .cfi_def_cfa_ 7, 8
            ret 
            .cfi_endproc