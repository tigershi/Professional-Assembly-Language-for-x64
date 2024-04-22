#parity flag test
#编译和执行
# as -o flagparitytest.o flagparitytest.S 
# ld -o flagparitytest flagparitytest.o
#./flagparitytest 
#输出结果
# echo $?
.section .text
.globl _start
_start:
movq $1, %rax
movq $4, %rbx
subq $3, %rbx # RBX is 1, binary is 00000001. so  parity flag is set is 0 
jp overhere
int $0x80
overhere:
movq $100, %rbx
int $0x80
