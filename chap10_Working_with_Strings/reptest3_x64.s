# reptest3.s - Moving a large string using MOVSQ and MOVSB
# as -o reptest3_x64.o reptest3_x64.s
#ld reptest3_x64.o -o reptest3_x64
.code64
.section .data
string1:
   .asciz "This is a test of the conversion program!\n"
length:
   .int 43
divisor:
   .int 4
.section .bss
   .lcomm buffer, 43
.section .text
.globl _start
_start:
   nop
   leaq string1, %rsi
   leaq buffer, %rdi
   movl length, %ecx
   shrl $3, %ecx
   cld
   rep movsq
   movl length, %ecx
   andl $7, %ecx
   rep movsb

   movq $0, %rdi
   movq $60, %rax
   syscall
