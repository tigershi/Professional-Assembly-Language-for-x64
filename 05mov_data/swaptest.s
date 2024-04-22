# swaptest.s – An example of using the BSWAP instruction#
#as -gstabs -o swaptest.o swaptest.s
#ld -o swaptest swaptest.o
#gdb -q swaptest
.section .text
.globl _start
_start:
nop
movl $0x7EFFEE7F, %ebx
bswap %ebx
movl $1, %eax
int $0x80
