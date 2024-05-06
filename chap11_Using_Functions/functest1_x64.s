# functest1.s - An example of using functions
#as -gstabs functest1_x64.s -o functest1_x64.o
#ld functest1_x64.o -o  functest1_x64
.code64
.section .data
precision:
   .byte 0x7f, 0x00
.section .bss
   .lcomm value, 4
.section .text
.globl _start
_start:
   nop
   finit
   fldcw precision

   movl $10, %ebx
   call area

   movl $2, %ebx
   call area

   movl $120, %ebx
   call area

   movq $0, %rdi
   movq $60, %rax
   syscall

.type area, @function
area:
   fldpi
   imull %ebx, %ebx
   movl %ebx, value
   filds value
   fmulp %st(0), %st(1)
   ret
