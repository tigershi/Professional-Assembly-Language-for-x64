	.file	"mactest2.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"a = %d, b = %d    result: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$20, %ebp
	movl	$10, %r8d
#APP
# 21 "mactest2.c" 1
	cmp %r8d, %ebp
	jge 0f
	movl %r8d, %r8d
	jmp 1f
	0:
	movl %ebp, %r8d
	1:
# 0 "" 2
#NO_APP
	movl	$20, %ecx
	movl	$10, %edx
	leaq	.LC0(%rip), %rbx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$30, %r8d
#APP
# 25 "mactest2.c" 1
	cmp %r8d, %ebp
	jge 0f
	movl %r8d, %r8d
	jmp 1f
	0:
	movl %ebp, %r8d
	1:
# 0 "" 2
#NO_APP
	movl	$20, %ecx
	movl	$30, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
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
