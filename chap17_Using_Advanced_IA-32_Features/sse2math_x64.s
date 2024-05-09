# sse2math.s - An example of using SSE2 arithmetic instructions
#as sse2math_x64.s -o sse2math_x64.o
#ld -o sse2math_x64 sse2math_x64.o
#./sse2math_x64 
.code64
.section .data
.align 16
value1:
   .double 10.42, -5.330
value2:
   .double 4.25, 2.10
value3:
   .int 10, 20, 30, 40
value4:
   .int 5, 15, 25, 35
.section .bss
   .lcomm result1, 16
   .lcomm result2, 16
.section .text
.globl _start
_start:
   nop
   movapd value1, %xmm0
   movapd value2, %xmm1
   movdqa value3, %xmm2
   movdqa value4, %xmm3

   mulpd %xmm1, %xmm0
   paddd %xmm3, %xmm2

   movapd %xmm0, result1
   movdqa %xmm2, result2

   movq $60, %rax
   movq $0, %rdi
   syscall
