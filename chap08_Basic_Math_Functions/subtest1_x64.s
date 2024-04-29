# subtest1.s - An example of the SUB instruction
#as -gstabs -o subtest1_x64.o subtest1_x64.s
#ld -o subtest1_x64 subtest1_x64.o
.code64

.section .data
data:
   .int 40
.section .text
.globl _start
_start:
   nop
   movl $0, %eax
   movl $0, %ebx
   movl $0, %ecx
   movb $20, %al
   subb $10, %al
   movsbl %al, %eax
   movw $100, %cx
   subw %cx, %bx
   movswl %bx, %ebx
   movl $100, %edx
   subl %eax, %edx
   subl data, %eax
   subl %eax, data
   movq $0, %rdi
   movq $60, %rax
   syscall
