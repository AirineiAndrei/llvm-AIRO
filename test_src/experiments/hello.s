	.text
	.file	"hello-world.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	$101, %ebp
	leaq	.Lstr(%rip), %rbx
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	puts@PLT
	decl	%ebp
	jne	.LBB0_1
# %bb.2:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lstr,@object                   # @str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"Hello, World!"
	.size	.Lstr, 14

	.ident	"clang version 19.0.0git (https://github.com/AirineiAndrei/llvm-AIRO.git 100018c233009202d074772ee67d41659e153a45)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
