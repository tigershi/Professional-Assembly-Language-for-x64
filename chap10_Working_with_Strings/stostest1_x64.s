# stostest1.s - An example of using the STOS instruction
#as -o stostest1_x64.o stostest1_x64.s
#ld stostest1_x64.o -o stostest1_x64
.code64
.section .data
space:
   .ascii " "
.section .bss
   .lcomm buffer, 256
.section .text
.globl _start
_start:
   nop
   leal space, %esi
   leal buffer, %edi
   movl $256, %ecx
   cld
   lodsb
   rep stosb

   movq $0, %rdi
   movq $60, %rax
   syscall
