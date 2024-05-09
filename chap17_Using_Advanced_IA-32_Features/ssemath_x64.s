# ssemath.s - An example of using SSE arithmetic instructions
#as ssemath_x64.s -o ssemath_x64.o
#ld -o ssemath_x64 ssemath_x64.o
# ./ssemath_x64
.code64
.section .data
.align 16
value1:
   .float 12.34, 2345., -93.2, 10.44
value2:
   .float 39.234, 21.4, 100.94, 10.56
.section .bss
   .lcomm result, 16
.section .text
.globl _start
_start:
   nop
   movaps value1, %xmm0
   movaps value2, %xmm1

   addps %xmm1, %xmm0
   sqrtps %xmm0, %xmm0
   maxps %xmm1, %xmm0
   movaps %xmm0, result

   movq $60, %rax
   movq $0, %rdi
   syscall
