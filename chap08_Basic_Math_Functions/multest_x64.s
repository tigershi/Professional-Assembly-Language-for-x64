# multest.s - An example of using the MUL instruction
#as -o multest_x64.o multest_x64.s 
#ld -o multest_x64 multest_x64.o -lc -I /lib64/ld-linux-x86-64.so.2

.code64
.section .data
data1:
   .int 315814
data2:
   .int 165432
result:
   .quad 0
output:
   .asciz "The result is %qd\n"
.section .text
.globl _start
_start:
   nop
   movl data1, %eax
   mull data2
   movl %eax, result
   movl %edx, result+4
   movq result, %rsi
   movq $output, $rdi
   call printf
   movq $0, %rdi
   call exit
