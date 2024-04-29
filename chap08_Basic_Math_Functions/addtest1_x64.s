
# addtest1.s - An example of the ADD instruction
#as -gstabs -o addtest1_x64.o addtest1_x64.s 
#ld -o addtest1_x64 addtest1_x64.o
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
   addb $10, %al
   movsbl %al, %eax
   movw $100, %cx
   addw %cx, %bx
   movswl %bx, %ebx
   movl $100, %edx
   addl %edx, %edx
   addl data, %eax
   addl %eax, data
   movq $0, %rdi
   movq $60, %rax
   syscall
