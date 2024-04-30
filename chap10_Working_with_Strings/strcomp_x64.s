# strcomp.s - An example of comparing strings
#as -o strcomp_x64.o strcomp_x64.s
#ld strcomp_x64.o -o strcomp_x64
.code64
.section .data
string1:
   .ascii "test"
length1:
   .int 4
string2:
   .ascii "test1"
length2:
   .int 5
.section .text
.globl _start
_start:
   nop
   lea string1, %esi
   lea string2, %edi
   movl length1, %ecx
   movl length2, %eax
   cmpl %eax, %ecx
   ja longer
   xchg %ecx, %eax
longer:
   cld
   repe cmpsb
   je equal
   jg greater
less:
   movq $255, %rdi
   movq $60, %rax
   syscall
greater:
   movq $1, %rdi
   movq $60, %rax
   syscall
equal:
   movl length1, %ecx
   movl length2, %eax
   cmpl %ecx, %eax
   jg greater
   jl less
   movq $0, %rdi
   movq $60, %rax
   syscall
