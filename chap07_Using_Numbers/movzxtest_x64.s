# movzxtest.s - An example of the MOVZX instruction
#as -gstabs -o movzxtest_x64.o movzxtest_x64.s
#ld -o movzxtest_x64 movzxtest_x64.o
.code64
.section .text
.globl _start
_start:
   nop
   movl $279, %ecx
   movzx %cl, %ebx

   movl %ebx, %edi
   movq $60, %rax
   syscall
