# cmpxchgtest.s - An example of the cmpxchg instruction
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
movl $1, %eax
int $0x80
