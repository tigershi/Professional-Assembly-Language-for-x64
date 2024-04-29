# saltest.s - An example of the SAL instruction
#as -gstabs saltest_x64.s -o saltest_x64.o
#ld -o saltest_x64 saltest_x64.o
.code64
.section .data
value1:
   .int 25
.section .text
.globl _start
_start:
   nop
   movl $10, %ebx
   sall %ebx
   movb $2, %cl
   sall %cl, %ebx
   sall $2, %ebx
   sall value1
   sall $2, value1
   movq $0, %rdi
   movq $60, %rax
   syscall
