	.text
	.file	"hello-world.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	leaq	.L.str(%rip), %rbx
	movq	%rbx, %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$2, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$2, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$2, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$2, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$2, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$2, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$3, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$3, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$3, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$3, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$3, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$3, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$4, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$4, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$4, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$4, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$4, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$4, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$5, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$5, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$5, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$5, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$5, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$5, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$6, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$6, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$6, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$6, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$6, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$6, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$7, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$7, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$7, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$7, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$7, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$7, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$8, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$8, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$8, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$8, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$8, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$8, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$9, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$9, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$9, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$9, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$9, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$9, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$10, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$10, %esi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$10, %esi
	movl	$4, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$10, %esi
	movl	$6, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$10, %esi
	movl	$8, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$10, %esi
	movl	$10, %edx
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Hello, World %d %d!\n"
	.size	.L.str, 21

	.ident	"clang version 19.0.0git (https://github.com/AirineiAndrei/llvm-AIRO.git aca4240ee9ab32639d37ea64dd0425e983a0fc0d)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
