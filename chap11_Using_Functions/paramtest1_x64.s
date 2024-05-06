# paramtest1.s - Listing command line parameters
#as -gstabs paramtest1_x64.s -o paramtest1_x64.o
#ld -o paramtest1_x64  paramtest1_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.section .data
output1:
   .asciz "There are %d parameters:\n"
output2:
   .asciz "%s\n"
.section .text
.globl _start
_start:
   movq (%rsp), %rbx
   movq $output1, %rdi
   movq %rbx, %rsi
   call printf
   movq %rbx, %rcx
   movq %rsp, %rbp
   leaq 8(%rbp), %rbp
   loop1:
   movq $output2, %rdi
   movq (%rbp), %rsi
   #the rcx is pass parameters need to callee saved before call printf
   movq %rcx, %rbx 
   call printf
   movq %rbx, %rcx
   leaq 8(%rbp), %rbp
   loop loop1

   movq $0, %rdi
   call exit
