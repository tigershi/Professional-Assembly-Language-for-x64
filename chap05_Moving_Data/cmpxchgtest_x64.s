# cmpxchgtest.s - An example of the cmpxchg instruction
#build and output(编译和输出)
#as -o cmpxchgtest_x64.o cmpxchgtest_x64.s
#ld -o cmpxchgtest_x64 cmpxchgtest_x64.o
.section .data
data:
.quad 100
.section .text
.globl _start
_start:
nop
movq $100, %rax
movq $5, %rbx
cmpxchg %rbx, data
# SYS_EXIT syscall
movq $0, %rdi
movq $60,%rax
syscall
