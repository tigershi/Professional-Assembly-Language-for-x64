# scastest2.s - An example of incorrectly using the SCAS instruction
#as -o scastest2_x64.o scastest2_x64.s 
#ld -o scastest2_x64 scastest2_x64.o
.code64
.section .data
string1:
   .ascii "This is a test - a long text string to scan."
length:
   .int 11
string2:
   .ascii "test"
.section .text
.globl _start
_start:
   nop
   leal string1, %edi
   leal string2, %esi
   movl length, %ecx
   lodsl
   cld
   repne scasl
   jne notfound
   subw length, %cx
   neg %cx
   movl $1, %eax
   movl %ecx,%edi
   movq $60, %rax
   syscall
notfound:
   movq $0, %rdi
   movq $60, %rax
   syscall
