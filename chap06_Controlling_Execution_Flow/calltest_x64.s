# calltest.s -� An example of using the CALL instruction
#as -o calltest_x64.o calltest_x64.s
#ld -o calltest_x64 calltest_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.section .data
output:
   .asciz "This is section %d\n"
.section .text
.globl _start
_start:
   movq $1, %rsi
   movq $output, %rdi
   call printf
   movq $1, %rsi
   movq $output, %rdi
   call overhere
   movq $1, %rsi
   movq $output, %rdi
   call printf
   movq $0, %rdi
   call exit

overhere:
  #align stack 16 bytes
   subq $8, %rsp
   call printf
   addq $8, %rsp
   ret
