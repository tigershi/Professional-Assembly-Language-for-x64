# movstest1.s - An example of the MOVS instructionsas movstest1_x64.s -o movstest1_x64.o
#as movstest1_x64.s -o movstest1_x64.o
#ld movstest1_x64.o -o movstest1_x64
.code64
.section .data
value1:
   .ascii "This is a test string.\n"
.section .bss
   .lcomm output, 23
.section .text
.globl _start
_start:
   nop
   leaq value1, %rsi
   leaq output, %rdi
   movsb
   movsw
   movsl
   movsq

   movq $0, %rdi
   movq $60, %rax
   syscall
