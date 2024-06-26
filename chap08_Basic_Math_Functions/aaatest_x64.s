# aaatest.s - An example of using the AAA instruction
.code64
.section .data
value1:
   .byte 0x05, 0x02, 0x01, 0x08, 0x02
value2:
   .byte 0x03, 0x03, 0x09, 0x02, 0x05
.section .bss
   .lcomm sum, 6
.section .text
.globl _start
_start:
   nop
   xor %edi, %edi
   movl $5, %ecx
   clc
loop1:
   movb value1(, %edi, 1), %al
   adcb value2(, %edi, 1), %al
   aaa #（64mod can't support）
   movb %al, sum(, %edi, 1)
   inc %edi
   loop loop1
   adcb $0, sum(, %edi, 4)

   movq $0, %rdi
   movq $60, %rax
   syscall
