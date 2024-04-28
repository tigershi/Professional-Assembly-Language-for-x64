# sizetest2.s - A sample program to view the executable size
#as -o sizetest2_x64.o sizetest2_x64.s
#ld -o sizetest2_x64 sizetest2_x64.o
.code64
.section .bss
   .lcomm buffer, 10000
.section .text
.globl _start
_start:
# SYS_EXIT syscall
   movq $0, %rdi
   movq $60,%rax
   syscall
