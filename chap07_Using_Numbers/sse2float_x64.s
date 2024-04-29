# sse2float.s - An example of moving SSE2 FP data types
#as -gstabs -o sse2float_x64.o sse2float_x64.s
#ld -o sse2float_x64 sse2float_x64.o
.code64
.section .data
value1:
   .double 12.34, 2345.543
value2:
   .double -5439.234, 32121.4
.section .bss
   .lcomm data, 16
.section .text
.globl _start
_start:
   nop
   vmovupd value1, %xmm0
   vmovupd value2, %xmm1
   vmovupd %xmm0, %xmm2
   vmovupd %xmm0, data

   movq $0, %rdi
   movq $60, %rax
   syscall

