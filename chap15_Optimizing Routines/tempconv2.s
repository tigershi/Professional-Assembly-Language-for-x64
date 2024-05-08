	.file	"tempconv.c"
	.text
	.p2align 4
	.globl	convert
	.type	convert, @function
convert:
.LFB23:
	.cfi_startproc
	endbr64
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edi, %xmm0
	subsd	.LC0(%rip), %xmm0
	divsd	.LC1(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE23:
	.size	convert, .-convert
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"    Temperature Conversion Chart"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Fahrenheit       Celsius"
.LC4:
	.string	"  %d             %5.2f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC2(%rip), %rdi
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	.LC4(%rip), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	puts@PLT
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm0, %xmm0
	movl	%ebp, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	cvtsi2sdl	%ebp, %xmm0
	movl	$1, %eax
	addl	$10, %ebp
	subsd	.LC0(%rip), %xmm0
	divsd	.LC1(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	__printf_chk@PLT
	cmpl	$230, %ebp
	jne	.L4
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1077936128
	.align 8
.LC1:
	.long	-858993459
	.long	1073532108
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
