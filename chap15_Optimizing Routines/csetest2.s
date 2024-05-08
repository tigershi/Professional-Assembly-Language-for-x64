	.file	"csetest.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The results are c=%d  d=%d  e=%d\n"
	.text
	.p2align 4
	.globl	funct1
	.type	funct1, @function
funct1:
.LFB23:
	.cfi_startproc
	endbr64
	imull	%esi, %edi
	movl	$500, %eax
	xorl	%edx, %edx
	leaq	.LC0(%rip), %rsi
	idivl	%edi
	movslq	%edi, %rcx
	movl	%edi, %edx
	imulq	$1717986919, %rcx, %rcx
	sarq	$33, %rcx
	movl	%eax, %r8d
	movl	%edi, %eax
	movl	$2, %edi
	sarl	$31, %eax
	subl	%eax, %ecx
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE23:
	.size	funct1, .-funct1
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC0(%rip), %rbx
	movl	$2, %r8d
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movl	$50, %ecx
	movl	$250, %edx
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	%rbx, %rsi
	movl	$2, %r8d
	xorl	%eax, %eax
	movl	$40, %ecx
	movl	$200, %edx
	movl	$2, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
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
