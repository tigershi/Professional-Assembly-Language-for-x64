# bcdtest.s - An example of using BCD integer value
#as -gstabs -o bcdtest_x64.o bcdtest_x64.s
#ld -o bcdtest_x64 bcdtest_x64.o
.code64
.section .data
data1:
   .byte 0x34, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data2:
   .int 2
.section .text
.globl _start
_start:
   nop
   fbld data1
   fimul data2
   fbstp data1

   movq $0, %rdi
   movq $60, %rax
   syscall
