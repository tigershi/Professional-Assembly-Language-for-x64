	.file	"vartest.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"The results are %d and %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	global1(%rip), %eax
	leaq	.LC1(%rip), %rsi
	movss	.LC0(%rip), %xmm0
	addss	global2(%rip), %xmm0
	movl	$2, %edi
	leal	100(%rax), %edx
	movl	$1, %eax
	cvtss2sd	%xmm0, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	global2
	.data
	.align 4
	.type	global2, @object
	.size	global2, 4
global2:
	.long	1101135872
	.globl	global1
	.align 4
	.type	global1, @object
	.size	global1, 4
global1:
	.long	10
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1128808448
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
