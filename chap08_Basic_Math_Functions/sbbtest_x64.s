# sbbtest.s - An example of using the SBB instruction
#as -o sbbtest_x64.o sbbtest_x64.s
#ld -o sbbtest_x64 sbbtest_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.section .data
data1:
   .quad 7252051615
data2:
   .quad 5732348928
result:
   .quad 0
output:
   .asciz "The result is %qd\n"
.section .text
.globl _start
_start:
   nop
   movl data1, %ebx
   movl data1+4, %eax
   movl data2, %edx
   movl data2+4, %ecx
   subl %ebx, %edx
   sbbl %eax, %ecx
   movl %edx, result
   movl %ecx, result+4
   movq result, %rsi
   movq $output, %rdi
   call printf
   movq $0, %rdi
   call exit
