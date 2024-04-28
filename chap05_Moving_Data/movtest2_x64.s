# movtest2.s  An example of moving register data to memory
#as -gstabs -o movtest2_x64.o movtest2_x64.s
#ld -o movtest2_x64 movtest2_x64.o
#gdb -q movtest2_x64
.code64
.section .data
   value:
      .int 1
.section .text
.globl _start
   _start:
      nop
      movl $100, %eax
      movl %eax, value
     # SYS_EXIT syscall
      movq $0, %rdi
      movq $60,%rax
      syscall     
