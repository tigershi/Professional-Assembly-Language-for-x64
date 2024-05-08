# areafunc.s - An example of a floating point return value
#as -o areafunc_x64.o areafunc_x64.s
.code64
.section .text
.type areafunc, @function
.globl areafunc
areafunc:
   subq $8, %rsp
   imull %edi, %edi
   cvtsi2ss %edi, %xmm0
   fldpi
   fstps (%rsp)
   mulss (%rsp), %xmm0
   addq $8, %rsp
   ret
   