# fcomtest.s - An example of the FCOM instruction
#as fcomtest_x64.s -o fcomtest_x64.o
#ld fcomtest_x64.o -o fcomtest_x64
.code64
.section .data
value1:
   .float 10.923
value2:
   .float 4.5532
.section .text
.globl _start
_start:
   nop
   flds value1
   fcoms value2
   fstsw
   sahf
   ja greater
   jb lessthan
   movq $0, %rdi
   movq $60, %rax
   syscall
greater:
   movq $2, %rdi
   movq $60, %rax
   syscall
lessthan:
   movq $1, %rdi
   movq $60, %rax
   syscall
