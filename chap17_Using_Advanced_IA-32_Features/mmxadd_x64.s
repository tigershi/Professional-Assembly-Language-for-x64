# mmxadd.s - An example of performing MMX addition
#as mmxadd_x64.s -o mmxadd_x64.o
#ld -o mmxadd_x64 mmxadd_x64.o
#./mmxadd_x64 
.code64
.section .data
value1:
   .int 10, 20
value2:
   .int 30, 40
.section .bss
   .lcomm result, 8
.section .text
.globl _start
_start:
   nop
   movq value1, %mm0
   movq value2, %mm1
   paddd %mm1, %mm0
   movq %mm0, result

   movq $60, %rax
   movq $0, %rdi
   syscall
