#build and output(编译和输出)
#as -o printf.o printf.S
#ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o printf -lc printf.so
.section .data
output:
  .asciz "The processor Vendor ID is '%s'\n"

.section .bss
  .lcomm buffer, 12

.section .text
   .globl _start
_start:
movq $0, %rax
cpuid
movq $buffer, %rdi
movl %ebx, (%rdi)
movl %edx, 4(%rdi)
movl %ecx, 8(%rdi)
movq $buffer, %rsi
movq $output, %rdi
callq printf
movq $0, %rdi
callq exit

