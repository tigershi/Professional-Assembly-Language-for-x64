# addtest3.s � An example of detecting a carry condition.
#as -gstabs -o addtest3_x64.o addtest3_x64.s
#ld -o addtest3_x64 addtest3_x64.o
.code64
.section .text
.globl _start
_start:
   nop
   movl $0, %ebx
   movb $190, %bl
   movb $100, %al
   addb %al, %bl
   jc over
   movb %bl, %dil
   movq $60, %rax
   syscall
over:
   movq $0, %rdi
   movq $60, %rax
   syscall
