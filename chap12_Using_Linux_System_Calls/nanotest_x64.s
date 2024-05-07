# nanotest.s - Another example of using system calls
#as -gstabs nanotest_x64.s  -o nanotest_x64.o
#ld nanotest_x64.o -o nanotest_x64
.code64
.section .data
timespec:
   .long 5, 0
output:
   .ascii "This is a test\n"
output_end:
   .equ len, output_end - output
.section .bss
   .lcomm rem, 16
.section .text
.globl _start
_start:
   nop
   movq $10, %rcx
loop1:
   #save the rcx register
   movq %rcx, %rbx 
   movq $1, %rax
   movq $1, %rdi
   movq $output, %rsi
   movq $len, %rdx
   syscall

   movq $35, %rax
   movq $timespec, %rdi
   movq $rem, %rsi
   syscall
   movq %rbx, %rcx
   loop loop1
 
   movq $60, %rax
   movq $0, %rdi
   syscall
