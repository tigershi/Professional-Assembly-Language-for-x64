# roundtest.s - An example of the FRNDINT instruction
#as -gstabs -o roundtest_x64.o roundtest_x64.s 
#ld roundtest_x64.o roundtest_x64
.code64
.section .data
value1:
   .float 3.65
rdown:
   .byte 0x7f, 0x07
rup:
   .byte 0x7f, 0x0b
.section .bss
   .lcomm result1, 4
   .lcomm result2, 4
   .lcomm result3, 4
.section .text
.globl _start
_start:
   nop
   finit
   flds value1
   frndint
   fists result1

   fldcw rdown
   flds value1
   frndint
   fists result2

   fldcw rup
   flds value1
   frndint
   fists result3

   movq $0, %rdi
   movq $60, %rax
   syscall
