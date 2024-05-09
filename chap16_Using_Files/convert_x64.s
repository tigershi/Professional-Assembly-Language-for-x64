# convert.s - A function to convert lower case letters to upper case
.code64
.section .text
.type convert, @function
.globl convert
convert:
	.cfi_startproc
	endbr64
   movq %rsi, %rcx
   movq %rdi, %rsi
convert_loop:
   lodsb
   cmpb $0x61, %al
   jl skip
   cmpb $0x7a, %al
   jg skip
   subb $0x20, %al
skip:
   stosb
   loop convert_loop
ret
   .cfi_endproc
