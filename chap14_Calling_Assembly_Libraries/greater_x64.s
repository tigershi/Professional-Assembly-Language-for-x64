# greater.s - An example of using multiple input values
#as -o greater_x64.o greater_x64.s
.code64
.section .text
.type greater, @function
.globl greater
greater:
   cmpq %rsi, %rdi
   cmovlq %rsi, %rdi
   movq %rdi, %rax
   ret
