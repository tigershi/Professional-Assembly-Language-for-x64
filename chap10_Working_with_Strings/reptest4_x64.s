# reptest4.s - An example of using REP backwards
#as -o reptest4_x64.o reptest4_x64.s 
#ld reptest4_x64.o -o reptest4_x64
.code64
.section .data
value1:
   .asciz "This is a test string.\n"
.section .bss
   .lcomm output, 24
.section .text
.globl _start
_start:
   nop
   leal value1+22, %esi
   leal output+22, %edi
   movl $23, %ecx
   std
   rep movsb

   movq $0, %rdi
   movq $60, %rax
   syscall
