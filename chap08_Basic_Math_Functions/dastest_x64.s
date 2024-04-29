# dastest.s - An example of using the DAS instruction
.section .data
value1:
   .byte 0x25, 0x81, 0x02
value2:
   .byte 0x33, 0x29, 0x05
.section .bss
   .lcomm result, 4
.section .text
.globl _start
_start:
   nop
   xor %edi, %edi
   movl $3, %ecx
loop1:
   movb value2(, %edi, 1), %al
   sbbb value1(, %edi, 1), %al
   das #(64 bit mode can't support)
   movb %al, result(, %edi, 1)
   inc %edi
   loop loop1
   sbbb $0, result(, %edi, 4)
   movq $0, %rdi
   movq $60, %rax
   syscall
