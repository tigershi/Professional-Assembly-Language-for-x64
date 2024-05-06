# area.s - The areacircumference function
.code64
.section .text
.type area, @function
.globl area
area:
   subq $8, %rsp
   imulq %rdi, %rdi
   movq %rdi, (%rsp)
   fldpi
   fildl (%rsp)
   fmulp %st(0), %st(1)
   fstpl (%rsp)
   movq (%rsp), %xmm0
   addq $8, %rsp
   ret
