# functest3.s - An example of using C style functions
#as -gstabs functest3_x64.s -o functest3_x64.o
#ld functest3_x64.o -o functest3_x64
#gdb -q functest3_x64
.code64
.section .data
precision:
   .byte 0x7f, 0x00
.section .bss
   .lcomm result, 8
.section .text
.globl _start
_start:
   nop
   finit
   fldcw precision

   movq $10, %rdi
   call area
   movq %xmm0, result

   movq $2, %rdi
   call area
   movq %xmm0, result

   movq $120, %rdi
   call area
   movq %xmm0, result

   movq $0, %rdi
   movq $60, %rax
   syscall

.type area, @function
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
