# movtest1.s  An example of moving data from memory to a register
#as -gstabs -o movtest1_x64.o movtest1_x64.s
#ld -o movtest1_x64 movtest1_x64.o
#gdb -q movtest1_x64
.code64
.section .data
   value:
      .int 1
.section .text
.globl _start
   _start:
      nop
      movl value, %ecx
    # SYS_EXIT syscall
      movq $0, %rdi
      movq $60,%rax
      syscall
