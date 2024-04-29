# jumptest.s � An example of the jmp instruction
#as -o jumptest_x64.o jumptest_x64.s
#ld -o jumptest_x64 jumptest_x64.o
#echo $?
.code64
.section .text
.globl _start
_start:
   nop
   movq $60, %rax
   jmp overhere
   movq $10, %rdi
   syscall
overhere:
   movq $20, %rdi
   syscall
