# fpmathfunc.s - An example of reading multiple input values
.code64
.section .text
.type fpmathfunc, @function
.globl fpmathfunc
fpmathfunc:
   cvtsi2ss %rdi, %xmm6
   divss %xmm6, %xmm0
   mulss %xmm2, %xmm1
   addss %xmm1, %xmm0
   cvtsi2ss %rsi, %xmm7
   mulss %xmm7, %xmm3
   divss %xmm5, %xmm4
   subss %xmm4, %xmm3
   divss %xmm3, %xmm0
   ret
