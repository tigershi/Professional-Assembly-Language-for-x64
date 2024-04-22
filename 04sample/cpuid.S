#cpuid.s Sample program to extract the processor Vendor ID
.section .data
output:
.ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"
.section .text
.globl _start
_start:
movq $0, %rax
cpuid
movq $output, %rdi
movl %ebx, 28(%rdi)
movl %edx, 32(%rdi)
movl %ecx, 36(%rdi)
movq $4, %rax
movq $1, %rbx
movq $output, %rcx
movq $42, %rdx
int $0x80
movq $1, %rax
movq $0, %rbx
int $0x80
