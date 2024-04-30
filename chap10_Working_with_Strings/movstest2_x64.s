# movstest2.s - A second example of the MOVS instructions
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
   leaq value1+22, %rsi
   leaq output+22, %rdi

   std
   movsb
   movsb
   movsw
   movsw
   movsl
   movsl
   movsq
   
   movq $1, %rax
   movq $1, %rdi
   movq $output, %rsi
   movq $23, %rdx
   syscall

   movq $0, %rdi
   movq $60, %rax
   syscall
