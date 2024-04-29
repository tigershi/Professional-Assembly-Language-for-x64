# cmptest.s - An example of using the CMP and JGE instructions
#as -o cmptest_x64.o cmptest_x64.s
#ld -o cmptest_x64 cmptest_x64.o
#./cmptest_x64
#echo $?
.code64
.section .text
.globl _start
_start:
   nop
   movq $15, %rax
   movq $10, %rbx
   cmp %rax, %rbx
   jge greater
   movq $15, %rdi
   movq $60, %rax
   syscall
greater:
   movq $20, %rdi
   movq $60, %rax
   syscall
