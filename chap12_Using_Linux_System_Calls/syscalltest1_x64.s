# syscalltest1.s - An example of passing input values to a system call
#as -gstabs syscalltest1_x64.s -o syscalltest1_x64.o
#ld syscalltest1_x64.o -o syscalltest1_x64
.code64
.section .data
output:
   .ascii "This is a test message.\n"
output_end:
   .equ len, output_end - output
.section .text
.globl _start
_start:
   movq $1, %rax
   movq $1, %rdi
   movq $output, %rsi
   movq $len, %rdx
   syscall

   movq $60, %rax
   movq $0, %rdi
   syscall
