# betterloop.s - An example of the loop and jcxz instructions
#as -o betterloop_x64.o betterloop_x64.s
#ld -o betterloop_x64 betterloop_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.section .data
output:
.asciz "The value is: %d\n"
.section .text
.globl _start
_start:
movq $0, %rcx
movq $0, %rax
jrcxz done
loop1:
addq %rcx, %rax
loop loop1
done:

movq %rax, %rsi
movq $output, %rdi
call printf

movq $0, %rdi
movq $60, %rax
syscall
