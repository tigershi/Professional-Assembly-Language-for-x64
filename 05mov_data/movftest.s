#the float and double test
#as -o movftest.o movftest.s 
#ld -o movftest movftest.o
.section .data
   floata:
      .float 3.14
   doublea:
      .double 3.141

.section .text
.globl _start
_start:
 movss floata, %xmm0
 movsd doublea, %xmm1
 movq $1, %rax
 movq $0, %rbx
 int $80
