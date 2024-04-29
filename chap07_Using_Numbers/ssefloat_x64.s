# ssefloat.s - An example of moving SSE FP data types
#as -gstabs -o ssefloat_x64.o ssefloat_x64.s
#ld -o ssefloat_x64 ssefloat_x64.o
.code64
.section .data
value1:
   .float 12.34, 2345.543, -3493.2, 0.44901
value2:
   .float -5439.234, 32121.4, 1.0094, 0.000003
.section .bss
   .lcomm data, 16
.section .text
.globl _start
_start:
   nop
   vmovups value1, %xmm0
   vmovups value2, %xmm1
   vmovups %xmm0, %xmm2
   vmovups %xmm0, data

   movq $0, %rdi
   movq $60, %rax
   syscall
