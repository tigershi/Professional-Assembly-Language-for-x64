# testfunc.s - An example of reading input values wrong
#as -o testfunc_x64.o testfunc_x64.s
.code64
.section .text
.type testfunc, @function
.globl testfunc
testfunc:
   cvtsi2sd %rdi, %xmm1
   mulsd %xmm1, %xmm0
   ret
