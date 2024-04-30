# movstest3.s - An example of moving an entire string
#as -gstabs movstest3_x64.s -o movstest3_x64.o
#ld movstest3_x64.o -o movstest3_x64
.code64
.section .data
value1:
   .ascii "This is a test string.\n"
.section .bss
   .lcomm output, 23
.section .text
.globl _start
_start:
   nop
   leaq value1, %rsi
   leaq output, %rdi
   movl $23, %ecx
   cld
loop1:
   movsb
   loop loop1

   movq $0, %rdi
   movq $60, %rax
   syscall
