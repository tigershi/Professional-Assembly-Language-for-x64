#overflow flag test
#编译和执行
# as -o flagoverflowtest.o flagoverflowtest.S 
# ld -o flagoverflowtest flagoverflowtest.o
# ./flagoverflowtest 
# 从输出流中去结构 
# echo $?
.section .text
.globl _start
_start:
nop
movq $1, %rax    #move 1 to the RAX register
movb $0x7f, %bl  #move the signed value 127 to the 8-bit BL register
addb $10, %bl    #Add 10 to the BL register
jo overhere
int $0x80  #call the Linux system call
overhere:
movq $0, %rbx  #move 0 to the RBX register
int $0x80  #call the Linux system call
