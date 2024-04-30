# fpmath1.s - An example of basic FPU math
#as -gstabs fpmath1_x64.s -o fpmath1_x64.o
#ld -o fpmath1_x64 fpmath1_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.section .data
value1:
   .float 43.65
value2:
   .int 22
value3:
   .float 76.34
value4:
   .float 3.1
value5:
   .float 12.43
value6:
   .int 6
value7:
   .float 140.2
value8:
   .float 94.21
output:
   .asciz "The result is %f\n"
.section .text
.globl _start
_start:
nop
   finit
   flds value1
   fidivl value2
   flds value3
   flds value4
   fmul %st(1), %st(0)
   fadd %st(2), %st(0)
   flds value5
   fimull value6
   flds value7
   flds value8
   fdivrp
   fsubr %st(1), %st(0)
   fdivr %st(2), %st(0)
   subq  $8, %rsp
   fstpl (%rsp)
   #use the following instruction is ok
   #movq (%rsp), %xmm0
   vmovsd (%rsp), %xmm0
   movq $output, %rdi
   addq $8, %rsp
   call printf
   movq $0, %rdi
   call exit
