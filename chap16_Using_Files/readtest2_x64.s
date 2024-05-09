# readtest2.s - A more complicated example of reading data from a file
.section .bss
   .lcomm buffer, 10
   .lcomm filehandle, 4
.section .text
.globl _start
_start:
   nop

   movq %rsp, %rbp
   movq $2, %rax
   movq 16(%rbp), %rdi
   movq $00, %rsi
   movq $0444, %rdx
   syscall
   test %eax, %eax
   js badfile
   movl %eax, filehandle


read_loop:
   movl $0, %eax
   movl filehandle, %edi
   movq $buffer, %rsi
   movq $10, %rdx
   syscall
   test %eax, %eax
   jz done
   js done

   movl %eax, %edx
   movq $buffer, %rsi
   movq $1, %rdi
   movq $1, %rax
   syscall

   test %eax, %eax
   js badfile
   jmp read_loop

done:
   movl $3, %eax
   movl filehandle, %edi
   syscall


badfile:
   movl %eax, %edi
   movl $60, %eax
   syscall
