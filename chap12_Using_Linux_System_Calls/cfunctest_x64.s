# cfunctest.s - An example of using C functions */
#as -o cfunctest_x64.o cfunctest_x64.s
#ld -o cfunctest_x64 cfunctest_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.section .data
output:
   .asciz "This is a test\n"
.section .text
.globl _start
_start:
   movq $10, %rcx
loop1:
   movq %rcx, %rbx
   movq $output, %rdi
   movq %rcx, %rsi
   call printf
   movq $5, %rdi
   call sleep
   movq %rbx, %rcx
   loop loop1

   movq $0, %rdi
   call exit
