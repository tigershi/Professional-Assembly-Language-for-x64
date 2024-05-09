# readtest1.s - An example of reading data from a file
#as readtest1_x64.s -o readtest1_x64.o
#ld readtest1_x64.o -o readtest1_x64
#./readtest1_x64 cpuid2.txt
.section .bss
   .lcomm buffer, 42
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

   movq $0, %rax
   movl filehandle, %edi
   movq $buffer, %rsi
   movq $42, %rdx
   syscall
   test %eax, %eax
   js badfile
   
   movq $1, %rax
   movq $1, %rdi
   movq $buffer, %rsi
   movq $42, %rdx
   syscall


   movq $3, %rax
   movl filehandle, %edi
   syscall

badfile:
   movl %eax, %edi
   movq $60, %rax
   syscall

