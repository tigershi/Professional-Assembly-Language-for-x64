#this is a hello demo
#build and output(编译和输出)
#as -o hello.o hello.S
#ld -o hello hello.o
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
