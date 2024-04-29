# signtest.s - An example of using the sign flag
#as -o signtest_x64.o signtest_x64.s
#ld -o signtest_x64 signtest_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
#./signtest_x64
.code64
.section .data
value:
   .int 21, 15, 34, 11, 6, 50, 32, 80, 10, 2
output:
   .asciz "The value is: %d\n"
.section .text
.globl _start
_start:
   movq $9, %rbx
loop:
   movl value(, %rbx, 4), %esi
   movq $output, %rdi
   call printf
   dec %rbx
   jns loop
   movq $0, %rdi
   movq $60, %rax
   syscall
