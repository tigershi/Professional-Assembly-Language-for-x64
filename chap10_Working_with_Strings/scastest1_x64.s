# scastest1.s - An example of the SCAS instruction
#as -o scastest1_x64.o scastest1_x64.s
#ld -o scastest1_x64 scastest1_x64.o
.code64
.section .data
string1:
   .ascii "This is a test - a long text string to scan."
length:
   .int 44
string2:
   .ascii "-"
.section .text
.globl _start
_start:
   nop
   leal string1, %edi
   leal string2, %esi
   movl length, %ecx
   lodsb
   cld
   repne scasb
   jne notfound
   subw length, %cx
   neg %cx
   movl %ecx, %edi
   movq $60, %rax
   syscall
notfound:
   movq $0, %rdi
   movq $60, %rax
   syscall
