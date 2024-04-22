.section .data
output:
.asciz "The largest value is %d\n"
outputval:
.asciz "The current value is %d\n"
values:
.int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl _start
_start:
nop
movq values, %rbx
movq $1, %rcx

loop:
movq values(, %rcx, 4), %rax

movq $output, %rdi
movq %rax, %rsi
call printf

cmp %rbx, %rax
cmova %rax, %rbx
inc %rcx
cmp $10, %rcx
jne loop
movq $output, %rdi
movq %rbx, %rsi
call printf
movq $0, %rdi
call exit
