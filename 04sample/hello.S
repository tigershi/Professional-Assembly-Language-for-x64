#this is a hello demo

.section .data
output:
   .ascii "hello world!\n"
.section .text
.globl _start
_start:
nop
movq $4, %rax
movq $1, %rbx
movq $output, %rcx
movq $13, %rdx
int $0x80
movq $1, %rax
movq $0, %rbx
int $0x80
