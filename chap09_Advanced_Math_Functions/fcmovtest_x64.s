# fcmovtest.s - An example of the FCMOVxx instructions
#as fcmovtest_x64.s -o fcmovtest_x64.o
#ld fcmovtest_x64.o -o fcmovtest_x64
.code64
.section .data
value1:
   .float 20.5
value2:
   .float 10.90
.section .text
.globl _start
_start:
   nop
   finit
   flds value1
   flds value2
   fcomi %st(1), %st(0)
   fcmovb %st(1), %st(0)

   movq $0, %rdi
   movq $60, %rax
   syscall
