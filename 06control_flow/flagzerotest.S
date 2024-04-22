#zero flag test
#编译和执行
# as -o flagzerotest.o flagzerotest.S 
# ld -o flagzerotest flagzerotest.o
# ./flagzerotest 
# 从输出流中去结构 
# echo $?
.section .text
.globl _start
_start:
nop
movq $0, %rbx
movq $10, %rdi
loop1:
inc %rbx
dec %rdi
jz out
jmp loop1
out:
movq $1, %rax
int $0x80
