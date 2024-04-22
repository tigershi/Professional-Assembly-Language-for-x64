.section .data
msg:
.asciz "This is a test message"
msg1:
.asciz "This is a int %d"

factors:
.double 37.45, 45.33, 12.30
height:
.int 63, 54, 34
length:
.long 62, 35, 47

.section .text
.globl _start
_start:
movq $1, %rcx
movq $1, %rax
movq length(,%rcx,8), %rbx
int $0x80
