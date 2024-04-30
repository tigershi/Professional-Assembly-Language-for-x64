# trigtest2.s - An example of using the FSINCOS instruction
#as -o trigtest2_x64.o trigtest2_x64.s 
#ld trigtest2_x64.o -o trigtest2_x64
.code64
.section .data
degree1:
   .float 90.0
val180:
   .int 180
.section .bss
   .lcomm sinresult, 4
   .lcomm cosresult, 4
.section .text
.globl _start
_start:
   nop
   finit
   flds degree1
   fidivs val180
   fldpi
   fmul %st(1), %st(0)
   fsincos
   fstps cosresult
   fsts sinresult

   movq $0, %rdi
   movq $60, %rax
   syscall
