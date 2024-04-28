# cmpxchg8btest.s - An example of the cmpxchg8b instruction
#build and output(编译和输出)
#as -o cmpxchg8btest_x64.o cmpxchg8btest_x64.s
#ld -o cmpxchg8btest_x64 cmpxchg8btest_x64.o
.section .data
data:
.byte 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88
.section .text
.globl _start
_start:
nop
movl $0x44332211, %rax
movl $0x88776655, %edx
movl $0x11111111, %ebx
movl $0x22222222, %ecx
cmpxchg8b data
# SYS_EXIT syscall
movq $0, %rdi
movq $60,%rax
syscall
