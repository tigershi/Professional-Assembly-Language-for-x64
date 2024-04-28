# cmovtest.s - An example of the CMOV instructions
#as -o cmovtest_x64.o cmovtest_x64.s
#ld -o cmovtest_x64 cmovtest_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
#./cmovtest_x64
.section .data
output:
   .asciz "The largest value is %d\n"
values:
   .int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl _start
_start:
   nop
   movl values, %ebx
   movq $1, %r12
loop:
   movl values(, %r12, 4), %eax
   cmp %ebx, %eax
   cmova %eax, %ebx
   inc %r12
   cmp $10, %r12
   jne loop

   movq $output, %rdi
   movq %rbx, %rsi
   call printf
   
   movq $0, %rdi
   call exit
