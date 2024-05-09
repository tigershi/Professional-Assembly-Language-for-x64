# ssecomp.s - An example of using SSE comparison instructions
#as ssecomp_x64.s -o ssecomp_x64.o
#ld -o ssecomp_x64 ssecomp_x64.o
#./ssecomp_x64 
.code64
.section .data
.align 16
value1:
   .float 12.34, 2345., -93.2, 10.44
value2:
   .float 12.34, 21.4, -93.2, 10.45
.section .bss
   .lcomm result, 16
.section .text
.globl _start
_start:
   nop
   movaps value1, %xmm0
   movaps value2, %xmm1

   cmpeqps %xmm1, %xmm0
   movaps %xmm0, result

   movq $60, %rax
   movq $0, %rdi
   syscall
