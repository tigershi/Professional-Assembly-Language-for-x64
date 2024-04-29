# mmxtest.s - An example of using the MMX data types
#as -gstabs -o mmxtest_x64.o mmxtest_x64.s
#ld -o mmxtest_x64 mmxtest_x64.o
.code64
.section .data
values1:
   .int 1, -1
values2:
   .byte 0x10, 0x05, 0xff, 0x32, 0x47, 0xe4, 0x00, 0x01
.section .text
.globl _start
_start:
   nop
   movq values1, %mm0
   movq values2, %mm1
   movq $0, %rdi
   movq $60, %rax
   syscall
