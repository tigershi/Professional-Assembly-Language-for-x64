# cmptest.s - An example of using the CMP and JGE instructions
#编译和执行
# as -o comptest.o comptest.S 
# ld -o comptest comptest.o
# ./comptest 
# 从输出流中去结构 
# echo $?
.section .text
.globl _start
_start:
nop
movq $15, %rax
movq $10, %rbx
cmp %rax, %rbx
jge greater
movq $1, %rax
int $0x80
greater:
movq $20, %rbx
movq $1, %rax
int $0x80
