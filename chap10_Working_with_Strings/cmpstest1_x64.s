# cmpstest1.s - A simple example of the CMPS instruction
#as -o cmpstest1_x64.o cmpstest1_x64.s
#ld -o cmpstest1_x64 cmpstest1_x64.o
.code64
.section .data
value1:
   .ascii "Test"
value2:
   .ascii "Test"
.section .text
.globl _start
_start:
   nop
   movl $1, %eax
   leal value1, %esi
   leal value2, %edi
   cld
   cmpsl
   je equal
   movq $1, %rdi
   movq $60, %rax
   syscall
equal:
   movq $0, %rdi
   movq $60, %rax
   syscall
