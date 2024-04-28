# swaptest.s � An example of using the BSWAP instruction
#as -gstabs -o swaptest_x64.o swaptest_x64.s
#ld -o swaptest_x64 swaptest_x64.o
#gdb -q swaptest_x64

.section .text
.globl _start
_start:
   nop
   movq $0x1122334455667788, %rbx
   bswap %rbx
# SYS_EXIT syscall
   movq $0, %rdi
   movq $60,%rax
   syscall
