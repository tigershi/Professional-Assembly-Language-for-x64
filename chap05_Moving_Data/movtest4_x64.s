# movtest4.s � An example of indirect addressing
#as -gstabs -o movtest4_x64.o movtest4_x64.s
#ld -o movtest4_x64 movtest4_x64.o
#gdb -q movtest4_x64
.code64
.section .data
values:
   .int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60
.section .text
.globl _start
_start:
   nop
   movl values, %eax
   movq $values, %rdi
   movl $100, 4(%rdi)
   movq $1, %rdi
   #becuase the move 4 bytes to %ebx, 
   #the %rbx 4 high byte will be clear to 0
   #movq $0x1122334455667788, %rbx
   movl values(, %rdi, 4), %ebx
   #the syscall$60 only the %dil register effective
   movq %rbx, %rdi
   movq $60, %rax
   syscall
   
