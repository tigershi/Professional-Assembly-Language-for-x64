#carry test
#编译和运行
#as -o flagcarrytest1.o flagcarrytest1.S 
#ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o flagcarrytest1 -lc flagcarrytest1.o
#./flagcarrytest1
#

.section .data
   output:
      .asciz "The value is: %d\n"

.section .text
.globl _start
_start:
nop
# Unlike the overflow flag, the DEC and INC instructions do not affect the carry flag.

movl $0xffffffff, %ebx
inc %ebx
jc overflow
movq $output, %rdi
movq $5, %rsi
call printf

movq $2, %rax
subq $4, %rax
jc overflow
movq $output, %rdi
movq $6, %rsi
call printf

overflow:
movq $output, %rdi
movq $3, %rsi
call printf

movq $1, %rax
movq $0, %rbx
int  $0x80
