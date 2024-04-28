# sizetest3.s - A sample program to view the executable size
#as -o sizetest3_x64.o sizetest3_x64.s
#ld -o sizetest3_x64 sizetest3_x64.o
.code64
.section .data
buffer:
   .fill 10000
.section .text
.globl _start
_start:
# SYS_EXIT syscall
   movq $0, %rdi
   movq $60,%rax
   syscall
