	.file	"sums.c"
	.text
	.p2align 4
	.globl	sums
	.type	sums, @function
sums:
.LFB23:
	.cfi_startproc
	endbr64
	movl	%edi, %edx
	testl	%edi, %edi
	jle	.L7
	leal	-1(%rdi), %eax
	cmpl	$9, %eax
	jbe	.L8
	movl	%edi, %ecx
	movdqa	.LC0(%rip), %xmm1
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movdqa	.LC1(%rip), %xmm3
	shrl	$2, %ecx
	.p2align 4,,10
	.p2align 3
.L4:
	movdqa	%xmm1, %xmm2
	addl	$1, %eax
	paddd	%xmm3, %xmm1
	paddd	%xmm2, %xmm0
	cmpl	%ecx, %eax
	jne	.L4
	movdqa	%xmm0, %xmm1
	movl	%edx, %ecx
	psrldq	$8, %xmm1
	andl	$-4, %ecx
	paddd	%xmm1, %xmm0
	addl	$1, %ecx
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	testb	$3, %dl
	je	.L1
.L3:
	leal	1(%rcx), %esi
	addl	%ecx, %eax
	cmpl	%esi, %edx
	jl	.L1
	addl	%esi, %eax
	leal	2(%rcx), %esi
	cmpl	%esi, %edx
	jl	.L1
	addl	%esi, %eax
	leal	3(%rcx), %esi
	cmpl	%esi, %edx
	jl	.L1
	addl	%esi, %eax
	leal	4(%rcx), %esi
	cmpl	%esi, %edx
	jl	.L1
	addl	%esi, %eax
	leal	5(%rcx), %esi
	cmpl	%esi, %edx
	jl	.L1
	addl	%esi, %eax
	leal	6(%rcx), %esi
	cmpl	%esi, %edx
	jl	.L1
	addl	%esi, %eax
	leal	7(%rcx), %esi
	cmpl	%esi, %edx
	jl	.L1
	addl	%esi, %eax
	leal	8(%rcx), %esi
	cmpl	%esi, %edx
	jl	.L1
	addl	%esi, %eax
	addl	$9, %ecx
	leal	(%rax,%rcx), %esi
	cmpl	%ecx, %edx
	cmovge	%esi, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
.L1:
	ret
.L8:
	xorl	%eax, %eax
	movl	$1, %ecx
	jmp	.L3
	.cfi_endproc
.LFE23:
	.size	sums, .-sums
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Value: %d   Sum: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$55, %ecx
	movl	$10, %edx
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	1
	.long	2
	.long	3
	.long	4
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
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
