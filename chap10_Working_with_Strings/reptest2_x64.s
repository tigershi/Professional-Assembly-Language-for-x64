# reptest2.s - An incorrect example of using the REP instruction
#as -o reptest2_x64.o reptest2_x64.s 
#ld reptest2_x64.o -o reptest2_x64
.code64
.section .data
value1:
   .ascii "This is a test string.\n"
value2:
   .ascii "Oops"
.section .bss
   .lcomm output, 23
.section .text
.globl _start
_start:
   nop
   leal value1, %esi
   leal output, %edi
   movl $6, %ecx
   cld
   rep movsl

   movq $0, %rdi
   movq $60, %rax
   syscall
