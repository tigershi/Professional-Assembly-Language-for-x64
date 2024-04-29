# movsxtest2.s - Another example using the MOVSX instruction
#as -gstabs -o movsxtest2_x64.o movsxtest2_x64.s
#ld -o movsxtest2_x64 movsxtest2_x64.o
.code64
.section .text
.globl _start
_start:
   nop
   movw $79, %cx
   xor %ebx, %ebx
   movw %cx, %bx
   movswq %cx, %rax
   movq $0, %rdi
   movq $60, %rax
   syscall
