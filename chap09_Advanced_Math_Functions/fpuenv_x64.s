# fpuenv.s - An example of the FSTENV and FLDENV instructions
#as -gstabs fpuenv_x64.s  -o fpuenv_x64.o
#ld fpuenv_x64.o -o fpuenv_x64
.code64
.section .data
value1:
   .float 12.34
value2:
   .float 56.789
rup:
   .byte 0x7f, 0x0b
.section .bss
   .lcomm buffer, 28
.section .text
.globl _start
_start:
   nop
   finit
   flds value1
   flds value2
   fldcw rup
   fstenv buffer

   finit
   flds value2
   flds value1

   fldenv buffer

   movq $0, %rdi
   movq $60, %rax
   syscall
