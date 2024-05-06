# paramtest2.s - Listing system environment variables.
#as -gstabs paramtest2_x64.s -o paramtest2_x64.o
#ld -o paramtest2_x64  paramtest2_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.section .data
output:
   .asciz "%s\n"
.section .text
.globl _start
_start:
  movq (%rsp), %rbp
  leaq 16(%rsp,%rbp,8), %rbp

loop1:
   cmpq $0, (%rbp)
   je endit
   movq $output, %rdi
   movq (%rbp), %rsi
   call printf
   addq $8, %rbp
   xorq %rcx, %rcx
   loop loop1
endit:
   movq $0, %rdi
   call exit
