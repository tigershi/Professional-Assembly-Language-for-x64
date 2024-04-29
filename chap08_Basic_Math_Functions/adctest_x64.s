# adctest.s - An example of using the ADC instruction
#as -o adctest_x64.o adctest_x64.s 
#ld -o adctest_x64 adctest_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
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
   movl data1, %ebx
   movl data1+4, %eax
   movl data2, %edx
   movl data2+4, %ecx
   addl %ebx, %edx
   adcl %eax, %ecx
   movl %edx, result
   movl %ecx, result+4
   movq result, %rsi
   movq $output, %rdi
   call printf
   movq $0, %rdi
   call exit
