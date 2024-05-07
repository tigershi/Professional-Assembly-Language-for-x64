	.file	"sincostest.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"The cosine is %f, and the sine is %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	flds	.LC0(%rip)
#APP
# 11 "sincostest.c" 1
	fsincos
# 0 "" 2
#NO_APP
	fstps	12(%rsp)
	pxor	%xmm0, %xmm0
	cvtss2sd	12(%rsp), %xmm0
	fstps	12(%rsp)
	pxor	%xmm1, %xmm1
	cvtss2sd	12(%rsp), %xmm1
	leaq	.LC1(%rip), %rsi
	movl	$2, %edi
	movl	$2, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1070141392
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
