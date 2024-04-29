# floattest.s - An example of using floating point numbers
#as -gstabs -o floattest_x64.o floattest.s
#ld -o floattest_x64 floattest_x64.o
.code64
.section .data

value1:
   .float 12.34
value2:
   .double 2353.631
.section .bss
   .lcomm data, 8
.section .text
.globl _start
_start:
   nop
   vmovss value1, %xmm0
   vmovsd value2, %xmm1
   vmovsd %xmm1, data
   
   movq $0, %rdi
   movq $60, %rax
   syscall
