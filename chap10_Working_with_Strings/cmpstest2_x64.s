# cmpstest2.s - An example of using the REPE CMPS instruction
#as -o cmpstest2_x64.o cmpstest2_x64.s 
#ld -o cmpstest2_x64 cmpstest2_x64.o
.code64
.section .data
value1:
   .ascii "This is a test of the CMPS instructions"
value2:
   .ascii "This is a test of the CMPS Instructions"
.section .text
.globl _start
_start:
   nop
   movl $1, %eax
   lea value1, %esi
   leal value2, %edi
   movl $39, %ecx
   cld
   repe cmpsb
   je equal
   movl %ecx, %edi
   movq $60, %rax
   syscall
equal:
   movq $0, %rdi
   movq $60, %rax
   syscall
