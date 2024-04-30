# setprec.s - An example of setting the precision bits in the Control Register
#as -gstabs setprec_x64.s -o setprec_x64.o
#ld -o setprec_x64 setprec_x64.o
.code64
.section .data
newvalue:
   .byte 0x7f, 0x00
.section .bss
   .lcomm control, 2
.section .text
.globl _start
_start:
   nop
   fstcw control
   fldcw newvalue
   fstcw control

   movq $0, %rdi
   movq $60, %rax
   syscall
