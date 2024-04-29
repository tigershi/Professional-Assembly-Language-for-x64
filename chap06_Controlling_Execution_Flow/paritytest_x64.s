# paritytest.s - An example of testing the parity flag
#as -o paritytest_x64.o paritytest_x64.s
#ld -o paritytest_x64 paritytest_x64.o
#./paritytest_x64
#echo $?


.code64
.section .text
.globl _start
_start:
   movq $60, %rax
   movq $4, %rdi
   subq $3,  %rdi
   #subq $1,  %rdi
   jp overhere
   syscall
overhere:
   movq $100, %rdi
   syscall
