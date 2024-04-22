#test sign flag
#编译和执行
#as -o flagsigntest.o flagsigntest.S
#ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o flagsigntest -lc flagsigntest.o
#./flagsigntest 
.section .data
value:
.int 21, 15, 34, 11, 6, 50, 32, 80, 10, 2
output:
   .asciz "The value is: %d\n"
.section .text
.globl _start
_start:
nop
movq $9, %rbx

sg_loop:
movq $output, %rdi
movq value(, %rbx, 4), %rsi
call printf
dec %rbx
jns sg_loop #The JNS 指令侦测RBX是否变为-1,当变为-1时，sign flag set 1

movq $1, %rax
movq $0, %rbx
int $0x80
