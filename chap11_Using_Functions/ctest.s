	.file	"ctest.c"
	.text
	.globl	function1
	.type	function1, @function
function1:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	imull	%eax, %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movsd	.LC0(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	function1, .-function1
	.section	.rodata
.LC1:
	.string	"Radius: %d,  Area: %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$10, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	function1
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	pxor	%xmm1, %xmm1
	cvtss2sd	-4(%rbp), %xmm1
	movq	%xmm1, %rdx
	movl	-8(%rbp), %eax
	movq	%rdx, %xmm0
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$2, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	function1
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	pxor	%xmm2, %xmm2
	cvtss2sd	-4(%rbp), %xmm2
	movq	%xmm2, %rdx
	movl	-8(%rbp), %eax
	movq	%rdx, %xmm0
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$120, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	function1
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	pxor	%xmm3, %xmm3
	cvtss2sd	-4(%rbp), %xmm3
	movq	%xmm3, %rdx
	movl	-8(%rbp), %eax
	movq	%rdx, %xmm0
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	-266631570
	.long	1074340345
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
