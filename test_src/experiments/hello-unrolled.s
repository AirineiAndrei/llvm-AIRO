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
	movl	$1000, %ebp                     # imm = 0x3E8
	leaq	.Lstr(%rip), %rbx
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	puts@PLT
	testl	%ebp, %ebp
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	movq	%rbx, %rdi
	callq	puts@PLT
	addl	$-20, %ebp
	jmp	.LBB0_1
.LBB0_3:
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

	.ident	"clang version 19.0.0git (https://github.com/AirineiAndrei/llvm-AIRO.git 81224cbc4c2567f14bd65c1930969aaa3cf6a3d3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
