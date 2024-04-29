# divtest.s - An example of the DIV instruction
#as -o divtest_x64.o divtest_x64.s
#ld -o divtest_x64 divtest_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.section .data
dividend:
   .quad 8335
divisor:
   .int 25
quotient:
   .int 0
remainder:
   .int 0
output:
   .asciz "The quotient is %d, and the remainder is %d\n"
.section .text
.globl _start
_start:
   nop
   movl dividend, %eax
   movl dividend+4, %edx
   divl divisor                      # WRONG prefix!
   movl %eax, quotient
   movl %edx, remainder
   movl remainder, %edx
   movl quotient, %esi
   movq $output, %rdi
   call printf
   movq $0, %rdi
   call exit
