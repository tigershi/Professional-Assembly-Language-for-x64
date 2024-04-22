# it call test
##ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o calltest -lc calltest.so

.section .data
output:
   .asciz "This is section %d\n"
.section .text
.globl _start

_start:
movq  $output, %rdi
movq  $1, %rsi
call printf
call overhere
movq $output, %rdi
movq $3, %rsi
call printf
movq $0, %rdi
call exit

#function overhere()
overhere:
pushq %rbp
movq %rsp, %rbp
movq $output, %rdi
movq $2, %rsi
call printf
movq %rbp, %rsp
popq %rbp
ret
