# strsize.s - Finding the size of a string using the SCAS instruction
#as -o strsize_x64.o strsize_x64.s
#ld strsize_x64.o -o strsize_x64
.section .data
string1:
   .asciz "Testing, one, two, three, testing.\n"
.section .text
.globl _start
_start:
   nop
   leal string1, %edi
   movl $0xffff, %ecx
   movb $0, %al
   cld
   repne scasb
   jne notfound
   subw $0xffff, %cx
   neg %cx
   dec %cx
   movl %ecx, %edi
   movq $60, %rax
   syscall
notfound:
   movq $0, %rdi
   movq $60, %rax
   syscall
