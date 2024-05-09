# mmxcomp.s - An example of performing MMX comparison
#as mmxcomp_x64.s -o mmxcomp_x64.o
#ld -o mmxcomp_x64 mmxcomp_x64.o
#./mmxcomp_x64
.section .data
value1:
   .short 10, 20, -30, 40
value2:
   .short 10, 40, -30, 45
.section .bss
   .lcomm result, 8
.section .text
.globl _start
_start:
   nop
   movq value1, %mm0
   movq value2, %mm1
   pcmpeqw %mm1, %mm0
   movq %mm0, result

   movq $60, %rax
   movq $0, %rdi
   syscall
