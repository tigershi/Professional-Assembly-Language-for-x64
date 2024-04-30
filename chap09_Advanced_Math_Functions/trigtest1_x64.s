# trigtest1.s - An example of using the FSIN and FCOS instructions
#as -o trigtest1_x64.o trigtest1_x64.s
#ld trigtest1_x64.o -o trigtest1_x64
.section .data
degree1:
   .float 90.0
val180:
   .int 180
.section .bss
   .lcomm radian1, 4
   .lcomm result1, 4
   .lcomm result2, 4
.section .text
.globl _start
_start:
   nop
   finit
   flds degree1
   fidivs val180
   fldpi
   fmul %st(1), %st(0)
   fsts radian1
   fsin
   fsts result1
   flds radian1
   flds radian1
   fcos
   fsts result2

   movq $0, %rdi
   movq $60, %rax
   syscall
