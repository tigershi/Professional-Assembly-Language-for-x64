# premtest.s - An example of using the FPREM1 instruction
#as premtest_x64.s -o premtest_x64.o
#ld premtest_x64.o -o premtest_x64
.code64
.section .data
value1:
   .float 20.65
value2:
   .float 3.97
.section .bss
   .lcomm result, 4
.section .text
.globl _start
_start:
   nop
   finit
   flds value2
   flds value1
loop:
   fprem1
   fstsw %ax
   testb $4, %ah
   jnz loop

   fsts result
   movq $0, %rdi
   movq $60, %rax
   syscall

