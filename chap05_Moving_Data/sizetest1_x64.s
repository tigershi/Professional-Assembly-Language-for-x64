# sizetest1.s  A sample program to view the executable size
#as -o sizetest2_x64.o sizetest2_x64.s
#ld -o sizetest2_x64 sizetest2_x64.o
.section .text
.globl _start
_start:
# SYS_EXIT syscall
   movq $0, %rdi
   movq $60,%rax
   syscall
