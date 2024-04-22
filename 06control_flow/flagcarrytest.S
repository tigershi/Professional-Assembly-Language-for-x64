#carry test
#编译和运行
#as -o flagcarrytest.o flagcarrytest.S 
#ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o flagcarrytest -lc flagcarrytest.o
#./flagcarrytest
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
movq $1, %rsi
call printf

movl $0xffffffff, %ebx
addl $1, %ebx
jc overflow
movq $output, %rdi
movq $2, %rsi
call printf

overflow:
movq $output, %rdi
movq $3, %rsi
call printf

movq $1, %rax
movq $0, %rbx
int  $0x80
