# quadtest.s - An example of quad integers
#as -gstabs -o quadtest_x64.o quadtest_x64.s
#ld -o quadtest_x64 quadtest_x64.o
.code64
.section .data
data1:
   .int 1, -1, 463345, -333252322, 0
data2:
   .quad 1, -1, 463345, -333252322, 0
.section .text
.globl _start
_start:
   nop
   movq $0, %rdi
   movq $60, %rax
   syscall
