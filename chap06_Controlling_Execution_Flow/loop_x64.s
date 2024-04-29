# loop.s - An example of the loop instruction
#as -o loop_x64.o loop_x64.s
#ld -o loop_x64 loop_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.section .data
output:
   .asciz "The value is: %d\n"
.section .text
.globl _start
_start:
   movq $100, %rcx
   movq $0, %rax
loop1:
   addq %rcx, %rax
   loop loop1
   movq %rax, %rsi
   movq $output, %rdi
   call printf

   movq $0, %rdi
   movq $60, %rax
   syscall
