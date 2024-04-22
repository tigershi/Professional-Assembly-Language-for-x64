#if then test
##build and output(编译和输出)
#as -o ifthen.o ifthen.S
#ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o ifthen -lc ifthen.o
#./ifthen

.section .data
  output:
     .asciz "the value is %d \n"

.section .text
.globl _start
_start:
nop
movq $100, %rax
movq $25, %rbx

if:
cmp %rbx, %rax
jle else
movq $output, %rdi
movq %rax, %rsi
call printf
jmp if_end;
else:
movq $output, %rdi
movq %rbx, %rsi
call printf
if_end:

movq $1, %rax
movq $0, %rbx
int $0x80
