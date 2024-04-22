
# movtest3.s – Another example of using indexed memory locations
#build and output(编译和输出)
# as -o movtest.so movtest.S
##ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o movtest -lc movtest.so
#note use the caller save register
.section .data
output:
   .asciz "The value is %d\n"

vals:
   .int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60

.section .text
.globl _start
_start:
nop
movq $0, %rbx

pr_loop:
movq $output, %rdi
movl vals(, %rbx, 4), %esi
call printf
incq %rbx
cmp $10, %rbx
jle pr_loop

movq $0, %rbx
movq $1, %rax
int $0x80
