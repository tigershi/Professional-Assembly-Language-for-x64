# functest2.s - An example of using global variables in functions
#as -gstabs functest2_x64.s -o functest2_x64.o
#ld functest2_x64.o -o  functest2_x64
.section .data
precision:
   .byte 0x7f, 0x00
.section .bss
   .lcomm radius, 4
   .lcomm result, 4
   .lcomm trash, 4
.section .text
.globl _start
_start:
   nop
   finit
   fldcw precision

   movl $10, radius
   call area

   movl $2, radius
   call area

   movl $120, radius
   call area

   movq $0, %rdi
   movq $60, %rax
   syscall

.type area, @function
area:
   fldpi
   filds radius
   fmul %st(0), %st(0)
   fmulp %st(0), %st(1)
   fstps result
   ret
