# convert.s - Converting lower to upper case
#as -o convert_x64.o convert_x64.s
#ld -o convert_x64 convert_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
.code64
.extern printf
.extern exit
.section .data
string1:
   .asciz "This is a TEST, of the conversion program!\n"
length:
   .int 43
.section .text
.globl _start
_start:
   nop
   leal string1, %esi
   movl %esi, %edi
   movl length, %ecx
   cld
loop1:
   lodsb
   cmpb $'a', %al
   jl skip
   cmpb $'z', %al
   jg skip
   subb $0x20, %al
skip:
   stosb
   loop loop1
end:
   movq $string1, %rdi
   call printf
   movq $0, %rdi
   call exit
