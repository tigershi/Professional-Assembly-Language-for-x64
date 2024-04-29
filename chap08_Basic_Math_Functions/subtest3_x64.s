# subtest3.s - An example of an overflow condition in a SUB instruction
#as -o subtest3_x64.o subtest3_x64.s
#ld -o subtest3_x64 subtest3_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.section .data
output:
   .asciz "The result is %d\n"
.section .text
.globl _start
_start:
   movl $-1590876934, %ebx
   movl $1259230143, %eax
   subl %eax, %ebx
   jo over
   movl %ebx, %esi
   movq $output, %rdi
   call printf
   movq $0, %rdi
   call exit
over:
   movq $0, %rsi
   movq $output, %rdi
   call printf
   movq $0, %rdi
   call exit
