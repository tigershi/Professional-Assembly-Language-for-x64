# fcomitest.s - An example of the FCOMI instruction
#as fcomtest_x64.s -o fcomtest_x64.o 
#ld fcomitest_x64.o -o fcomitest_x64
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
   flds value2
   flds value1
   fcomi %st(1), %st(0)
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

