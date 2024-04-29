# imultest2.s - An example of detecting an IMUL overflow
#as -o imultest2_x64.o imultest2_x64.s
#ld -o imultest2_x64 imultest2_x64.o
.section .text
.globl _start
_start:
   nop
   movw $680, %ax
   movw $100, %cx
   imulw %cx
   jo over
   movq $0, %rdi
   movq $60, %rax
   syscall
over:
   movq $1, %rdi
   movq $60, %rax
   syscall
