# paramtest3.s - An example of using command line parameters
#as -gstabs paramtest3_x64.s -o paramtest3_x64.o
#ld -o paramtest3_x64  paramtest3_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
#./paramtest3_x64 10
.code64
.section .data
output:
   .asciz "The area is: %f\n"
.section .bss
   .lcomm result, 8
.section .text
.globl _start
_start:
   subq $8, %rsp
   nop
   finit
   movq 24(%rsp), %rdi
   call atol
   movq %rax, result
   fldpi
   fildq result
   fmul %st(0), %st(0)
   fmul %st(1), %st(0)
   fstpl (%rsp)

   movq $output, %rdi
   movq (%rsp), %xmm0
   movq $1, %rax
   addq $8, %rsp
   call printf

   movq $0, %rdi
   call exit
