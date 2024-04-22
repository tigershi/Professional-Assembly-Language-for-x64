# loop.s - An example of the loop instruction
#as -o loopbad.o loopbad.S 
#ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o loopbad -lc loopbad.o
# ./loopbad 
.section .data
output:
   .asciz "The value is: %d\n"
.section .text
.globl _start
_start:
movq $100, %rcx
movq $0, %rax
#当RCX设置为0，会死循环
loop1:
addq %rcx, %rax
loop loop1

movq $output, %rdi
movq %rax, %rsi
call printf

movq $1, %rax
movq $0, %rbx
int $0x80
