.section .data
values:
.int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60
.section .text
.globl _start
_start:
nop
movq values, %rax
movq $values, %rdi
movq $100, 4(%rdi)
movq $2, %rdi
movq values(, %rdi, 4), %rbx
movq $1, %rax
int $0x80
