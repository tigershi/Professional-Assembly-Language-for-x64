# movtest3.s � Another example of using indexed memory locations
#as -o movtest3_x64.o movtest3_x64.s
#ld -o movtest3_x64 movtest3_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
#gdb -q movtest3_x64
.code64
.section .data
output:
   .asciz "The value is %d\n"
values:
   .int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60
.section .text
.globl _start
_start:
   nop
   movl $0, %ebx

loop:
   movl values(, %ebx, 4), %eax
#because of the %rdi use the transfer paramters, 
#it changes the %edi to %ebx(it has segment error if use the %edi)
   movq $output, %rdi
   movl %ebx, %esi
   call printf
   inc %ebx
   cmpl $11, %ebx
   jne loop

   movq $0, %rdi
   movq $60, %rax
   syscall
