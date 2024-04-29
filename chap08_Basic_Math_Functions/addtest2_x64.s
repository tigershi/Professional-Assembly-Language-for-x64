# addtest2.s - An example of the ADD instruction and negative numbers
#as -gstabs -o addtest2_x64.o addtest2_x64.s 
#ld -o addtest2_x64 addtest2_x64.o
.code64
.section .data
data:
   .int -40
.section .text
.globl _start
_start:
   nop
   movl $-10, %eax
   movl $-200, %ebx
   movl $80, %ecx
   addl data, %eax
   addl %ecx, %eax
   addl %ebx, %eax
   addl %eax, data
   addl $210, data

   movq $0, %rdi
   movq $60, %rax
   syscall
