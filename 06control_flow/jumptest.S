#使用 as -gstabs -o jumptest.o jumptest.S 编译
#编译和执行
# as -o jumptest.o jumptest.S 
# ld -o jumptest jumptest.o
# ./jumptest 
# 从输出流中去结构 
# echo $?
# 查看反编译代码
#objdump -D jumptest
# as -gstabs -o jumptest.o jumptest.S
# ld -o jumptest jumptest.o
# gdb -q jumptest


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
