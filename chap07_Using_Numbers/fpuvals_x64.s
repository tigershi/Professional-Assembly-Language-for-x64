# fpuvals.s - An example of pushing floating point constants
.code64
.section .text
.globl _start
_start:
   nop
   fld1
   fldl2t
   fldl2e
   fldpi
   fldlg2
   fldln2
   fldz

   movq $0, %rdi
   movq $60, %rax
   syscall
