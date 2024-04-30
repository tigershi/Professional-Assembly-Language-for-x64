# getstatus.s - Get the FPU Status register contents
#as -gstabs getstatus_x64.s -o getstatus_x64.o
#ld -o getstatus_x64 getstatus_x64.o
#./getstatus_x64
# gdb -q getstatus_x64
.code64
.section .bss
   .lcomm status, 2
.section .text
.globl _start
_start:
   nop
   fstsw %ax
   fstsw status

   movq $0, %rdi
   movq $60, %rax
   syscall
