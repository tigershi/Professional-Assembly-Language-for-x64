# functest4.s - An example of using external functions
#as -gstabs functest4_x64.s -o functest4_x64.o
#ld functest4_x64.o -o functest4_x64
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

   movq $60, %rax
   movq $0, %rdi
   syscall
