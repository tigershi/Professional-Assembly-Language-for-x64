# inttest.s - An example of using signed integers
#as -gstabs -o inttest_x64.o inttest_x64.s
#ld -o inttest_x64 inttest_x64.o
.code64
.section .data
data:
   .int -45
.section .text
.globl _start
_start:
   nop
   movl $-345, %ecx
   movw $0xffb1, %dx
   movl data, %edi
   movq $60, %rax
   syscall

