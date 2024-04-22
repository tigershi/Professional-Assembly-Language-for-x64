# pushpop.s - An example of using the PUSH and POP instructions
.section .data
data:
.int 125, 23
.section .text
.globl _start
_start:
nop
movl $24420, %ecx
movw $350, %bx
movl $100, %eax
pushq %rcx
pushq %rbx
pushq %rax
pushq data
pushq $data

popq %rax
popq %rax
popq %rax
popq %rax
popq %rax

movq $0, %rbx
movq $1, %rax
int $0x80
