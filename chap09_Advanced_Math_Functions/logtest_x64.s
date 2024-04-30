# logtest.s - An example of using the FYL2X instruction
#as logtest_x64.s -o logtest_x64.o
#ld logtest_x64.o -o logtest_x64
.code64
.section .data
value:
   .float 12.0
base:
   .float 10.0
.section .bss
   .lcomm result, 4
.section .text
.globl _start
_start:
   nop
   finit
   fld1
   flds base
   fyl2x
   fld1
   fdivp
   flds value
   fyl2x
   fsts result

   movq $0, %rdi
   movq $60, %rax
   syscall
