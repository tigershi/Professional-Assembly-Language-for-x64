# subtest2.s - An example of a subtraction carry
#as -gstabs -o subtest2_x64.o subtest2_x64.s
#ld -o subtest2_x64 subtest2_x64.o
.section .text
.globl _start
_start:
   nop
   movl $5, %eax
   movl $2, %ebx
   subl %eax, %ebx
   jc under
   movl %ebx, %edi
   movq $60, %rax
   syscall
under:
   movq $0, %rdi
   movq $60, %rax
   syscall
