# convtest.s - An example of data conversion
#as -gstabs -o convtest_x64.o convtest_x64.s 
#ld -o convtest_x64 convtest_x64.o
.code64
.section .data
value1:
   .float 1.25, 124.79, 200.0, -312.5
value2:
   .int 1, -435, 0, -25
.section .bss
   .lcomm data, 16
.section .text
.globl _start
_start:
   nop
   vcvtps2dq value1, %xmm0
   vcvttps2dq value1, %xmm1
   vcvtdq2ps value2, %xmm2
   vmovdqu %xmm0, data

   movq $0, %rdi
   movq $60, %rax
   syscall
