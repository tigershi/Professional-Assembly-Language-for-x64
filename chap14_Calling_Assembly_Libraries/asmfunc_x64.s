# asmfunc.s - An example of a simple assembly language function
.code64
.section .data
testdata:
   .ascii "This is a test message from the asm function\n"
datasize:
   .int 45
.section .text
.type asmfunc, @function
.globl asmfunc
asmfunc:
   movq $1, %rax
   movq $1, %rdi
   movq $testdata, %rsi
   movq datasize, %rdx
   syscall
   xorq %rax, %rax
   ret
