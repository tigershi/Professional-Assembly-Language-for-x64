#build and output(编译和输出)
#as -o jumptest.o jumptest.S
#ld -o jumptest jumptest.o
.section .text
.globl _start
_start:
nop
movq $1, %rax
jmp overhere
movq $10, %rbx
int $0x80
overhere:
movq $20, %rbx
int $0x80