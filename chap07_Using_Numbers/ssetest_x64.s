# ssetest.s - An example of using 128-bit SSE registers
#as -gstabs -o ssetest_x64.o ssetest_x64.s
#ld -o ssetest_x64 ssetest_x64.o

.code64
.section .data
values1:
   .int 1, -1, 0, 135246
values2:
   .quad 1, -1
.section .text
.globl _start
_start:
   nop
   movdqu values1, %xmm0
   movdqu values2, %xmm1
   
   movq $0, %rdi
   movq $60, %rax
   syscall
