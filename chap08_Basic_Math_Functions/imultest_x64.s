# imultest.s - An example of the IMUL instruction formats
#as -gstabs -o imultest_x64.o imultest_x64.s
#ld -o imultest_x64 imultest_x64.o
.section .data
value1:
   .int 10
value2:
   .int -35
value3:
   .int 400
.section .text
.globl _start
_start:
   nop
   movl value1, %ebx
   movl value2, %ecx
   imull %ebx, %ecx
   movl value3, %edx
   imull $2, %edx, %eax
   movq $0, %rdi
   movq $60, %rax
   syscall
