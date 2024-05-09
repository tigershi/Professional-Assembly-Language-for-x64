# sizefunc.s - Find the size of a file
.code64
.section .text
.type sizefunc, @function
.globl sizefunc
sizefunc:
	.cfi_startproc
	endbr64
#syscall is 8
   movl $8, %eax;//lseek系统调用号是8
#param1 is rdi
#param2 offset is 0
   movq $0, %rsi
#param3 seek_end is 2
   movq $2, %rdx;
   syscall
   ret
   .cfi_endproc
   