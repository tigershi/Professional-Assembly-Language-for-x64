# cmpxchg8btest.s - An example of the cmpxchg8b instruction
#build and output(编译和输出)
#as -o cmpxchg16btest.o -gstabs cmpxchg16btest_x64.s
#ld -o cmpxchg16btest cmpxchg16btest.o
.section .data
data:
.quad 0x4444333322221111, 0x8888777766665555
.section .text
.globl _start
_start:
nop
movq $0x4444333322221111, %rax
movq $0x8888777766665555, %rdx
movq $0x1111111111111111, %rbx
movq $0x2222222222222222, %rcx
cmpxchg16b data
# SYS_EXIT syscall
movq $0, %rdi
movq $60,%rax
syscall
