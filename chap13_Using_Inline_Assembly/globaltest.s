	.file	"globaltest.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"the answer is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
#APP
# 10 "globaltest.c" 1
#`pusha' is not supported in 64-bit mode
	pusha
	movl a, %eax
	movl b, %ebx
	imull %ebx, %eax
	movl %eax, result
#`popa' is not supported in 64-bit mode
	popa
# 0 "" 2
#NO_APP
	movl	result(%rip), %edx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	result
	.bss
	.align 4
	.type	result, @object
	.size	result, 4
result:
	.zero	4
	.globl	b
	.data
	.align 4
	.type	b, @object
	.size	b, 4
b:
	.long	20
	.globl	a
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	10
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
