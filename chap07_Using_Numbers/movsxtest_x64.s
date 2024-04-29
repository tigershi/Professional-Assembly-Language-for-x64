# movsxtest.s - An example of the MOVSX instruction#as -gstabs -o movsxtest2_x64.o movsxtest2_x64.s
#as -gstabs -o movsxtest_x64.o movsxtest_x64.s
#ld -o movsxtest_x64 movsxtest_x64.o
.code64
.section .text
.globl _start
_start:
   nop
   movw $-79, %cx
   movl $0, %ebx
   movw %cx, %bx
   movswq %cx, %rax
   movq $0, %rdi
   movq $60, %rax
   syscall
