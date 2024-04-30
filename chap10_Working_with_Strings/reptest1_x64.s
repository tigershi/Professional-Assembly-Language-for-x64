# reptest1.s - An example of the REP instruction
#as -o reptest1_x64.o reptest1_x64.s
#ld reptest1_x64.o -o reptest1_x64
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
   leal value1, %esi
   leal output, %edi
   movl $23, %ecx
   cld
   rep movsb

   movq $0, %rdi
   movq $60, %rax
   syscall
