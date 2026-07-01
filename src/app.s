	.file	"app.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.def	snprintf;	.scl	3;	.type	32;	.endef
	.seh_proc	snprintf
snprintf:
.LFB5:
	.file 1 "C:/mingw64/x86_64-w64-mingw32/include/stdio.h"
	.loc 1 787 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	.loc 1 789 35
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 790 14
	movq	-16(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	__ms_vsnprintf
	movl	%eax, -4(%rbp)
	.loc 1 792 10
	movl	-4(%rbp), %eax
	.loc 1 793 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.seh_endproc
.lcomm g_container,8,8
.lcomm g_iface,8,8
	.data
	.align 32
g_current_file:
	.ascii "data/records.csv\0"
	.space 239
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\12========================================\12\0"
	.align 8
.LC1:
	.ascii "  \346\240\241\345\233\255\351\200\211\350\257\276\350\256\260\345\275\225\346\243\200\347\264\242\344\270\216\345\210\206\346\236\220\347\263\273\347\273\237\12\0"
	.align 8
.LC2:
	.ascii "  \346\225\260\346\215\256\347\273\223\346\236\204\344\270\216\347\256\227\346\263\225\350\257\276\347\250\213\350\256\276\350\256\241\12\0"
	.align 8
.LC3:
	.ascii "========================================\12\0"
	.align 8
.LC4:
	.ascii "\350\257\273\345\217\226\350\276\223\345\205\245\345\244\261\350\264\245\357\274\214\347\250\213\345\272\217\351\200\200\345\207\272\343\200\202\12\0"
.LC5:
	.ascii "\350\257\267\350\276\223\345\205\245\346\234\211\346\225\210\351\200\211\351\241\271\343\200\202\12\0"
.LC6:
	.ascii "\346\204\237\350\260\242\344\275\277\347\224\250\357\274\214\345\206\215\350\247\201\357\274\201\12\0"
	.align 8
.LC7:
	.ascii "\346\227\240\346\225\210\351\200\211\351\241\271\357\274\214\350\257\267\351\207\215\346\226\260\350\276\223\345\205\245\343\200\202\12\0"
	.text
	.globl	run_app
	.def	run_app;	.scl	2;	.type	32;	.endef
	.seh_proc	run_app
run_app:
.LFB4286:
	.file 2 "src/app.c"
	.loc 2 38 20
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	.loc 2 41 5
	leaq	.LC0(%rip), %rcx
	call	print_utf8_printf
	.loc 2 42 5
	leaq	.LC1(%rip), %rcx
	call	print_utf8_printf
	.loc 2 43 5
	leaq	.LC2(%rip), %rcx
	call	print_utf8_printf
	.loc 2 44 5
	leaq	.LC3(%rip), %rcx
	call	print_utf8_printf
.L24:
.LBB2:
	.loc 2 47 9
	call	display_main_menu
	.loc 2 49 14
	leaq	-48(%rbp), %rax
	movl	$32, %edx
	movq	%rax, %rcx
	call	read_line
	.loc 2 49 13
	xorl	$1, %eax
	.loc 2 49 12
	testb	%al, %al
	je	.L4
	.loc 2 50 13
	leaq	.LC4(%rip), %rcx
	call	print_utf8_printf
	jmp	.L3
.L4:
	.loc 2 53 23
	movzbl	-48(%rbp), %eax
	.loc 2 53 12
	testb	%al, %al
	jne	.L6
	.loc 2 54 13
	leaq	.LC5(%rip), %rcx
	call	print_utf8_printf
	jmp	.L24
.L6:
	.loc 2 57 18
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	atoi
	movl	%eax, -4(%rbp)
	.loc 2 59 9
	cmpl	$11, -4(%rbp)
	ja	.L8
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L10(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L10(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L10:
	.long	.L21-.L10
	.long	.L20-.L10
	.long	.L19-.L10
	.long	.L18-.L10
	.long	.L17-.L10
	.long	.L16-.L10
	.long	.L15-.L10
	.long	.L14-.L10
	.long	.L13-.L10
	.long	.L12-.L10
	.long	.L11-.L10
	.long	.L9-.L10
	.text
.L20:
	.loc 2 60 21
	call	select_data_structure
	.loc 2 60 13
	jmp	.L7
.L19:
	.loc 2 61 21
	call	load_data
	.loc 2 61 13
	jmp	.L7
.L18:
	.loc 2 62 21
	call	save_data
	.loc 2 62 13
	jmp	.L7
.L17:
	.loc 2 63 21
	call	insert_record
	.loc 2 63 13
	jmp	.L7
.L16:
	.loc 2 64 21
	call	delete_record
	.loc 2 64 13
	jmp	.L7
.L15:
	.loc 2 65 21
	call	find_record
	.loc 2 65 13
	jmp	.L7
.L14:
	.loc 2 66 21
	call	filter_and_sort
	.loc 2 66 13
	jmp	.L7
.L13:
	.loc 2 67 21
	call	statistics_menu
	.loc 2 67 13
	jmp	.L7
.L12:
	.loc 2 68 21
	call	delete_expired
	.loc 2 68 13
	jmp	.L7
.L11:
	.loc 2 69 22
	call	performance_menu
	.loc 2 69 13
	jmp	.L7
.L9:
	.loc 2 70 22
	call	generate_data_menu
	.loc 2 70 13
	jmp	.L7
.L21:
	.loc 2 72 21
	movq	g_container(%rip), %rax
	.loc 2 72 20
	testq	%rax, %rax
	je	.L23
	.loc 2 72 33 discriminator 1
	movq	g_iface(%rip), %rax
	testq	%rax, %rax
	je	.L23
	.loc 2 73 28
	movq	g_iface(%rip), %rax
	movq	8(%rax), %rax
	.loc 2 73 21
	movq	g_container(%rip), %rdx
	movq	%rdx, %rcx
	call	*%rax
.LVL0:
.L23:
	.loc 2 75 17
	leaq	.LC6(%rip), %rcx
	call	print_utf8_printf
	jmp	.L3
.L8:
	.loc 2 78 17
	leaq	.LC7(%rip), %rcx
	call	print_utf8_printf
.L7:
.LBE2:
	.loc 2 46 15 discriminator 1
	jmp	.L24
.L3:
	.loc 2 81 1
	addq	$80, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4286:
	.seh_endproc
	.def	trim_whitespace;	.scl	3;	.type	32;	.endef
	.seh_proc	trim_whitespace
trim_whitespace:
.LFB4287:
	.loc 2 83 43
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 2 84 8
	cmpq	$0, 16(%rbp)
	je	.L34
	.loc 2 85 11
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 2 86 11
	jmp	.L28
.L30:
	.loc 2 87 14
	addq	$1, -8(%rbp)
.L28:
	.loc 2 86 12
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 2 86 11
	testb	%al, %al
	je	.L29
	.loc 2 86 45 discriminator 1
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 2 86 22 discriminator 1
	movzbl	%al, %eax
	movl	%eax, %ecx
	movq	__imp_isspace(%rip), %rax
	call	*%rax
.LVL1:
	.loc 2 86 19 discriminator 1
	testl	%eax, %eax
	jne	.L30
.L29:
	.loc 2 89 26
	movq	16(%rbp), %rcx
	call	strlen
	movq	%rax, %rdx
	.loc 2 89 11
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	.loc 2 90 11
	jmp	.L31
.L33:
	.loc 2 91 12
	subq	$1, -16(%rbp)
.L31:
	.loc 2 90 11
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jbe	.L32
	.loc 2 90 56 discriminator 1
	movq	-16(%rbp), %rax
	subq	$1, %rax
	.loc 2 90 50 discriminator 1
	movzbl	(%rax), %eax
	.loc 2 90 27 discriminator 1
	movzbl	%al, %eax
	movl	%eax, %ecx
	movq	__imp_isspace(%rip), %rax
	call	*%rax
.LVL2:
	.loc 2 90 24 discriminator 1
	testl	%eax, %eax
	jne	.L33
.L32:
	.loc 2 93 31
	movq	-16(%rbp), %rax
	subq	-8(%rbp), %rax
	.loc 2 93 12
	movq	%rax, -24(%rbp)
	.loc 2 94 5
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	memmove
	.loc 2 95 11
	movq	16(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 95 17
	movb	$0, (%rax)
	jmp	.L25
.L34:
	.loc 2 84 18
	nop
.L25:
	.loc 2 96 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4287:
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii "\15\12\0"
	.text
	.def	read_line;	.scl	3;	.type	32;	.endef
	.seh_proc	read_line
read_line:
.LFB4288:
	.loc 2 98 50
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 2 99 8
	cmpq	$0, 16(%rbp)
	je	.L36
	.loc 2 99 17 discriminator 2
	cmpq	$0, 24(%rbp)
	jne	.L37
.L36:
	.loc 2 99 38 discriminator 3
	movl	$0, %eax
	jmp	.L38
.L37:
	.loc 2 101 10
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL3:
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	fgets
	.loc 2 101 8
	testq	%rax, %rax
	jne	.L39
	.loc 2 102 16
	movl	$0, %eax
	jmp	.L38
.L39:
	.loc 2 105 12
	leaq	.LC8(%rip), %rdx
	movq	16(%rbp), %rcx
	call	strcspn
	movq	%rax, %rdx
	.loc 2 105 11
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 105 37
	movb	$0, (%rax)
	.loc 2 106 5
	movq	16(%rbp), %rcx
	call	trim_whitespace
	.loc 2 107 12
	movl	$1, %eax
.L38:
	.loc 2 108 1
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4288:
	.seh_endproc
	.section .rdata,"dr"
.LC9:
	.ascii "%s\0"
	.text
	.def	read_int;	.scl	3;	.type	32;	.endef
	.seh_proc	read_int
read_int:
.LFB4289:
	.loc 2 110 88
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, %eax
	movq	%r9, 40(%rbp)
	movb	%al, 32(%rbp)
	.loc 2 112 8
	cmpq	$0, 16(%rbp)
	je	.L41
	.loc 2 113 9
	movq	16(%rbp), %rdx
	leaq	.LC9(%rip), %rcx
	call	print_utf8_printf
	.loc 2 114 9
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL4:
	movq	%rax, %rcx
	call	fflush
.L41:
	.loc 2 116 10
	leaq	-64(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rcx
	call	read_line
	.loc 2 116 9
	xorl	$1, %eax
	.loc 2 116 8
	testb	%al, %al
	je	.L42
	.loc 2 117 12
	cmpq	$0, 40(%rbp)
	je	.L43
	.loc 2 117 21 discriminator 1
	movq	40(%rbp), %rax
	movb	$0, (%rax)
.L43:
	.loc 2 118 16
	movl	24(%rbp), %eax
	jmp	.L50
.L42:
	.loc 2 120 13
	movzbl	-64(%rbp), %eax
	.loc 2 120 8
	testb	%al, %al
	jne	.L45
	.loc 2 121 12
	cmpb	$0, 32(%rbp)
	je	.L46
	.loc 2 122 16
	cmpq	$0, 40(%rbp)
	je	.L47
	.loc 2 122 25 discriminator 1
	movq	40(%rbp), %rax
	movb	$1, (%rax)
.L47:
	.loc 2 123 20
	movl	24(%rbp), %eax
	jmp	.L50
.L46:
	.loc 2 125 12
	cmpq	$0, 40(%rbp)
	je	.L48
	.loc 2 125 21 discriminator 1
	movq	40(%rbp), %rax
	movb	$0, (%rax)
.L48:
	.loc 2 126 16
	movl	24(%rbp), %eax
	jmp	.L50
.L45:
	.loc 2 128 8
	cmpq	$0, 40(%rbp)
	je	.L49
	.loc 2 128 17 discriminator 1
	movq	40(%rbp), %rax
	movb	$1, (%rax)
.L49:
	.loc 2 129 12
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	atoi
.L50:
	.loc 2 130 1 discriminator 1
	addq	$96, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4289:
	.seh_endproc
	.def	read_float;	.scl	3;	.type	32;	.endef
	.seh_proc	read_float
read_float:
.LFB4290:
	.loc 2 132 94
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movss	%xmm1, 24(%rbp)
	movl	%r8d, %eax
	movq	%r9, 40(%rbp)
	movb	%al, 32(%rbp)
	.loc 2 134 8
	cmpq	$0, 16(%rbp)
	je	.L52
	.loc 2 135 9
	movq	16(%rbp), %rdx
	leaq	.LC9(%rip), %rcx
	call	print_utf8_printf
	.loc 2 136 9
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL5:
	movq	%rax, %rcx
	call	fflush
.L52:
	.loc 2 138 10
	leaq	-64(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rcx
	call	read_line
	.loc 2 138 9
	xorl	$1, %eax
	.loc 2 138 8
	testb	%al, %al
	je	.L53
	.loc 2 139 12
	cmpq	$0, 40(%rbp)
	je	.L54
	.loc 2 139 21 discriminator 1
	movq	40(%rbp), %rax
	movb	$0, (%rax)
.L54:
	.loc 2 140 16
	movss	24(%rbp), %xmm0
	jmp	.L61
.L53:
	.loc 2 142 13
	movzbl	-64(%rbp), %eax
	.loc 2 142 8
	testb	%al, %al
	jne	.L56
	.loc 2 143 12
	cmpb	$0, 32(%rbp)
	je	.L57
	.loc 2 144 16
	cmpq	$0, 40(%rbp)
	je	.L58
	.loc 2 144 25 discriminator 1
	movq	40(%rbp), %rax
	movb	$1, (%rax)
.L58:
	.loc 2 145 20
	movss	24(%rbp), %xmm0
	jmp	.L61
.L57:
	.loc 2 147 12
	cmpq	$0, 40(%rbp)
	je	.L59
	.loc 2 147 21 discriminator 1
	movq	40(%rbp), %rax
	movb	$0, (%rax)
.L59:
	.loc 2 148 16
	movss	24(%rbp), %xmm0
	jmp	.L61
.L56:
	.loc 2 150 8
	cmpq	$0, 40(%rbp)
	je	.L60
	.loc 2 150 17 discriminator 1
	movq	40(%rbp), %rax
	movb	$1, (%rax)
.L60:
	.loc 2 151 19
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	atof
	.loc 2 151 12
	cvtsd2ss	%xmm0, %xmm0
.L61:
	.loc 2 152 1 discriminator 1
	addq	$96, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4290:
	.seh_endproc
	.def	read_string;	.scl	3;	.type	32;	.endef
	.seh_proc	read_string
read_string:
.LFB4291:
	.loc 2 154 99
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	.loc 2 155 8
	cmpq	$0, 16(%rbp)
	je	.L63
	.loc 2 156 9
	movq	16(%rbp), %rdx
	leaq	.LC9(%rip), %rcx
	call	print_utf8_printf
	.loc 2 157 9
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL6:
	movq	%rax, %rcx
	call	fflush
.L63:
	.loc 2 159 10
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	read_line
	.loc 2 159 9
	xorl	$1, %eax
	.loc 2 159 8
	testb	%al, %al
	je	.L64
	.loc 2 160 12
	cmpq	$0, 32(%rbp)
	je	.L67
	.loc 2 160 33 discriminator 1
	movq	24(%rbp), %rax
	movb	$0, (%rax)
	.loc 2 161 9 discriminator 1
	jmp	.L67
.L64:
	.loc 2 163 15
	movq	24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 2 163 8
	testb	%al, %al
	jne	.L62
	.loc 2 163 27 discriminator 1
	cmpq	$0, 40(%rbp)
	je	.L62
	.loc 2 164 9
	movq	32(%rbp), %rax
	leaq	-1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	.loc 2 165 15
	movq	32(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 165 26
	movb	$0, (%rax)
	jmp	.L62
.L67:
	.loc 2 161 9
	nop
.L62:
	.loc 2 167 1
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4291:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "\12========== \344\270\273\350\217\234\345\215\225 ==========\12\0"
	.align 8
.LC11:
	.ascii "1. \351\200\211\346\213\251\346\225\260\346\215\256\347\273\223\346\236\204\357\274\210\351\223\276\350\241\250/\345\223\210\345\270\214\350\241\250\357\274\211\12\0"
.LC12:
	.ascii "2. \345\212\240\350\275\275\346\225\260\346\215\256\357\274\210CSV\357\274\211\12\0"
.LC13:
	.ascii "3. \344\277\235\345\255\230\346\225\260\346\215\256\12\0"
.LC14:
	.ascii "4. \346\217\222\345\205\245\350\256\260\345\275\225\12\0"
.LC15:
	.ascii "5. \345\210\240\351\231\244\350\256\260\345\275\225\12\0"
.LC16:
	.ascii "6. \346\237\245\346\211\276\350\256\260\345\275\225\12\0"
.LC17:
	.ascii "7. \347\255\233\351\200\211\344\270\216\346\216\222\345\272\217\12\0"
.LC18:
	.ascii "8. \347\273\237\350\256\241\345\210\206\346\236\220\12\0"
.LC19:
	.ascii "9. \346\211\271\351\207\217\345\210\240\351\231\244\350\277\207\346\234\237\350\256\260\345\275\225\12\0"
.LC20:
	.ascii "10. \346\200\247\350\203\275\345\257\271\346\257\224\346\265\213\350\257\225\12\0"
.LC21:
	.ascii "11. \347\224\237\346\210\220\346\265\213\350\257\225\346\225\260\346\215\256\12\0"
.LC22:
	.ascii "0. \351\200\200\345\207\272\12\0"
.LC23:
	.ascii "\350\257\267\350\276\223\345\205\245\351\200\211\351\241\271\357\274\232\0"
	.text
	.def	display_main_menu;	.scl	3;	.type	32;	.endef
	.seh_proc	display_main_menu
display_main_menu:
.LFB4292:
	.loc 2 169 37
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	.loc 2 170 5
	leaq	.LC10(%rip), %rcx
	call	print_utf8_printf
	.loc 2 171 5
	leaq	.LC11(%rip), %rcx
	call	print_utf8_printf
	.loc 2 172 5
	leaq	.LC12(%rip), %rcx
	call	print_utf8_printf
	.loc 2 173 5
	leaq	.LC13(%rip), %rcx
	call	print_utf8_printf
	.loc 2 174 5
	leaq	.LC14(%rip), %rcx
	call	print_utf8_printf
	.loc 2 175 5
	leaq	.LC15(%rip), %rcx
	call	print_utf8_printf
	.loc 2 176 5
	leaq	.LC16(%rip), %rcx
	call	print_utf8_printf
	.loc 2 177 5
	leaq	.LC17(%rip), %rcx
	call	print_utf8_printf
	.loc 2 178 5
	leaq	.LC18(%rip), %rcx
	call	print_utf8_printf
	.loc 2 179 5
	leaq	.LC19(%rip), %rcx
	call	print_utf8_printf
	.loc 2 180 5
	leaq	.LC20(%rip), %rcx
	call	print_utf8_printf
	.loc 2 181 5
	leaq	.LC21(%rip), %rcx
	call	print_utf8_printf
	.loc 2 182 5
	leaq	.LC22(%rip), %rcx
	call	print_utf8_printf
	.loc 2 183 5
	leaq	.LC23(%rip), %rcx
	call	print_utf8_printf
	.loc 2 184 5
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL7:
	movq	%rax, %rcx
	call	fflush
	.loc 2 185 1
	nop
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4292:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC24:
	.ascii "\12===== \347\224\237\346\210\220\346\265\213\350\257\225\346\225\260\346\215\256 =====\12\0"
	.align 8
.LC25:
	.ascii "1. \347\224\237\346\210\220 100 \346\235\241 (data/generated_100.csv)\12\0"
	.align 8
.LC26:
	.ascii "2. \347\224\237\346\210\220 1000 \346\235\241 (data/generated_1000.csv)\12\0"
	.align 8
.LC27:
	.ascii "3. \347\224\237\346\210\220 10000 \346\235\241 (data/generated_10000.csv)\12\0"
.LC28:
	.ascii "4. \350\207\252\345\256\232\344\271\211\346\225\260\351\207\217\12\0"
.LC29:
	.ascii "\350\257\267\351\200\211\346\213\251\357\274\232\0"
.LC30:
	.ascii "\350\257\273\345\217\226\350\276\223\345\205\245\345\244\261\350\264\245\343\200\202\12\0"
.LC31:
	.ascii "generated_100.csv\0"
.LC32:
	.ascii "generated_1000.csv\0"
.LC33:
	.ascii "generated_10000.csv\0"
.LC34:
	.ascii "\350\257\267\350\276\223\345\205\245\347\224\237\346\210\220\346\225\260\351\207\217\357\274\232\0"
	.align 8
.LC35:
	.ascii "\350\257\267\350\276\223\345\205\245\350\276\223\345\207\272\346\226\207\344\273\266\350\267\257\345\276\204\357\274\210\345\233\236\350\275\246\344\275\277\347\224\250 data/generated_custom.csv\357\274\211\357\274\232\0"
.LC36:
	.ascii "generated_custom.csv\0"
.LC37:
	.ascii "\346\227\240\346\225\210\351\200\211\346\213\251\343\200\202\12\0"
.LC38:
	.ascii "\346\225\260\351\207\217\345\277\205\351\241\273\345\244\247\344\272\216 0\343\200\202\12\0"
.LC39:
	.ascii "\345\267\262\347\224\237\346\210\220 %d \346\235\241\350\256\260\345\275\225\345\210\260 %s\12\0"
	.align 8
.LC40:
	.ascii "\347\224\237\346\210\220\345\244\261\350\264\245\357\274\214\350\257\267\346\243\200\346\237\245\350\267\257\345\276\204\345\222\214\346\235\203\351\231\220\343\200\202\12\0"
	.text
	.def	generate_data_menu;	.scl	3;	.type	32;	.endef
	.seh_proc	generate_data_menu
generate_data_menu:
.LFB4293:
	.loc 2 187 38
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	subq	$320, %rsp
	.seh_stackalloc	320
	.cfi_def_cfa_offset 336
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 208
	.seh_endprologue
	.loc 2 188 5
	leaq	.LC24(%rip), %rcx
	call	print_utf8_printf
	.loc 2 189 5
	leaq	.LC25(%rip), %rcx
	call	print_utf8_printf
	.loc 2 190 5
	leaq	.LC26(%rip), %rcx
	call	print_utf8_printf
	.loc 2 191 5
	leaq	.LC27(%rip), %rcx
	call	print_utf8_printf
	.loc 2 192 5
	leaq	.LC28(%rip), %rcx
	call	print_utf8_printf
	.loc 2 193 5
	leaq	.LC29(%rip), %rcx
	call	print_utf8_printf
	.loc 2 195 18
	leaq	171(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	read_int
	movl	%eax, 172(%rbp)
	.loc 2 196 9
	movzbl	171(%rbp), %eax
	xorl	$1, %eax
	.loc 2 196 8
	testb	%al, %al
	je	.L70
	.loc 2 197 9
	leaq	.LC30(%rip), %rcx
	call	print_utf8_printf
	.loc 2 198 9
	jmp	.L69
.L70:
	.loc 2 201 9
	movl	$0, 188(%rbp)
	.loc 2 202 17
	movq	$0, 176(%rbp)
	cmpl	$2, 172(%rbp)
	je	.L72
	cmpl	$2, 172(%rbp)
	jg	.L73
	cmpl	$1, 172(%rbp)
	je	.L74
	jmp	.L75
.L73:
	cmpl	$3, 172(%rbp)
	je	.L76
	cmpl	$4, 172(%rbp)
	je	.L77
	jmp	.L75
.L74:
	.loc 2 206 23
	movl	$100, 188(%rbp)
	.loc 2 206 35
	leaq	.LC31(%rip), %rax
	movq	%rax, 176(%rbp)
	.loc 2 206 9
	jmp	.L78
.L72:
	.loc 2 207 23
	movl	$1000, 188(%rbp)
	.loc 2 207 36
	leaq	.LC32(%rip), %rax
	movq	%rax, 176(%rbp)
	.loc 2 207 9
	jmp	.L78
.L76:
	.loc 2 208 23
	movl	$10000, 188(%rbp)
	.loc 2 208 37
	leaq	.LC33(%rip), %rax
	movq	%rax, 176(%rbp)
	.loc 2 208 9
	jmp	.L78
.L77:
	.loc 2 210 21
	leaq	171(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %edx
	leaq	.LC34(%rip), %rcx
	call	read_int
	movl	%eax, 188(%rbp)
	.loc 2 211 17
	movzbl	171(%rbp), %eax
	xorl	$1, %eax
	.loc 2 211 16
	testb	%al, %al
	je	.L79
	.loc 2 212 17
	leaq	.LC30(%rip), %rcx
	call	print_utf8_printf
	.loc 2 213 17
	jmp	.L69
.L79:
	.loc 2 215 13
	leaq	.LC35(%rip), %rcx
	call	print_utf8_printf
	.loc 2 216 13
	leaq	-96(%rbp), %rax
	leaq	.LC36(%rip), %r9
	movl	$256, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	read_string
	.loc 2 217 18
	leaq	-96(%rbp), %rax
	movq	%rax, 176(%rbp)
	.loc 2 218 13
	jmp	.L78
.L75:
	.loc 2 220 13
	leaq	.LC37(%rip), %rcx
	call	print_utf8_printf
	.loc 2 221 13
	jmp	.L69
.L78:
	.loc 2 224 8
	cmpl	$0, 188(%rbp)
	jg	.L80
	.loc 2 225 9
	leaq	.LC38(%rip), %rcx
	call	print_utf8_printf
	.loc 2 226 9
	jmp	.L69
.L80:
	.loc 2 230 9
	movq	176(%rbp), %rdx
	movl	188(%rbp), %eax
	movl	%eax, %ecx
	call	generate_csv
	.loc 2 230 8
	testb	%al, %al
	je	.L81
	.loc 2 231 9
	movq	176(%rbp), %rdx
	movl	188(%rbp), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC39(%rip), %rcx
	call	print_utf8_printf
	jmp	.L69
.L81:
	.loc 2 233 9
	leaq	.LC40(%rip), %rcx
	call	print_utf8_printf
	nop
.L69:
	.loc 2 235 1
	addq	$320, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -312
	ret
	.cfi_endproc
.LFE4293:
	.seh_endproc
	.section .rdata,"dr"
.LC41:
	.ascii "\12\350\257\267\351\200\211\346\213\251\346\225\260\346\215\256\347\273\223\346\236\204\357\274\232\12\0"
.LC42:
	.ascii "1. \345\217\214\345\220\221\351\223\276\350\241\250\12\0"
.LC43:
	.ascii "2. \345\223\210\345\270\214\350\241\250\12\0"
.LC44:
	.ascii "\350\257\267\350\276\223\345\205\245\346\225\260\345\255\227\357\274\232\0"
.LC45:
	.ascii "\345\267\262\351\200\211\346\213\251\345\217\214\345\220\221\351\223\276\350\241\250\343\200\202\12\0"
.LC46:
	.ascii "\345\267\262\351\200\211\346\213\251\345\223\210\345\270\214\350\241\250\343\200\202\12\0"
	.align 8
.LC47:
	.ascii "\346\227\240\346\225\210\351\200\211\346\213\251\357\274\214\350\257\267\351\207\215\346\226\260\351\200\211\346\213\251\343\200\202\12\0"
.LC48:
	.ascii "\345\256\271\345\231\250\345\210\233\345\273\272\346\210\220\345\212\237\343\200\202\12\0"
	.align 8
.LC49:
	.ascii "\345\256\271\345\231\250\345\210\233\345\273\272\345\244\261\350\264\245\357\274\214\350\257\267\346\243\200\346\237\245\345\206\205\345\255\230\343\200\202\12\0"
	.text
	.def	select_data_structure;	.scl	3;	.type	32;	.endef
	.seh_proc	select_data_structure
select_data_structure:
.LFB4294:
	.loc 2 237 41
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	.loc 2 239 5
	leaq	.LC41(%rip), %rcx
	call	print_utf8_printf
	.loc 2 240 5
	leaq	.LC42(%rip), %rcx
	call	print_utf8_printf
	.loc 2 241 5
	leaq	.LC43(%rip), %rcx
	call	print_utf8_printf
	.loc 2 242 5
	leaq	.LC44(%rip), %rcx
	call	print_utf8_printf
	.loc 2 244 14
	leaq	-5(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	read_int
	movl	%eax, -4(%rbp)
	.loc 2 245 9
	movzbl	-5(%rbp), %eax
	xorl	$1, %eax
	.loc 2 245 8
	testb	%al, %al
	je	.L85
	.loc 2 246 9
	leaq	.LC30(%rip), %rcx
	call	print_utf8_printf
	.loc 2 247 9
	jmp	.L84
.L85:
	.loc 2 250 9
	movq	g_container(%rip), %rax
	.loc 2 250 8
	testq	%rax, %rax
	je	.L87
	.loc 2 250 21 discriminator 1
	movq	g_iface(%rip), %rax
	testq	%rax, %rax
	je	.L87
	.loc 2 251 16
	movq	g_iface(%rip), %rax
	movq	8(%rax), %rax
	.loc 2 251 9
	movq	g_container(%rip), %rdx
	movq	%rdx, %rcx
	call	*%rax
.LVL8:
	.loc 2 252 21
	movq	$0, g_container(%rip)
	.loc 2 253 17
	movq	$0, g_iface(%rip)
.L87:
	.loc 2 256 8
	cmpl	$1, -4(%rbp)
	jne	.L88
	.loc 2 257 19
	call	get_list_interface
	.loc 2 257 17
	movq	%rax, g_iface(%rip)
	.loc 2 258 9
	leaq	.LC45(%rip), %rcx
	call	print_utf8_printf
	jmp	.L89
.L88:
	.loc 2 259 15
	cmpl	$2, -4(%rbp)
	jne	.L90
	.loc 2 260 19
	call	get_hash_interface
	.loc 2 260 17
	movq	%rax, g_iface(%rip)
	.loc 2 261 9
	leaq	.LC46(%rip), %rcx
	call	print_utf8_printf
	jmp	.L89
.L90:
	.loc 2 263 9
	leaq	.LC47(%rip), %rcx
	call	print_utf8_printf
	.loc 2 264 9
	jmp	.L84
.L89:
	.loc 2 267 26
	movq	g_iface(%rip), %rax
	movq	(%rax), %rax
	.loc 2 267 19
	call	*%rax
.LVL9:
	.loc 2 267 17
	movq	%rax, g_container(%rip)
	.loc 2 268 9
	movq	g_container(%rip), %rax
	.loc 2 268 8
	testq	%rax, %rax
	je	.L91
	.loc 2 269 9
	leaq	.LC48(%rip), %rcx
	call	print_utf8_printf
	jmp	.L84
.L91:
	.loc 2 271 9
	leaq	.LC49(%rip), %rcx
	call	print_utf8_printf
	.loc 2 272 17
	movq	$0, g_iface(%rip)
.L84:
	.loc 2 274 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4294:
	.seh_endproc
	.section .rdata,"dr"
.LC50:
	.ascii "\350\257\267\345\205\210\351\200\211\346\213\251\346\225\260\346\215\256\347\273\223\346\236\204\357\274\201\12\0"
	.align 8
.LC51:
	.ascii "\350\276\223\345\205\245\346\226\207\344\273\266\345\220\215\357\274\210\347\233\264\346\216\245\345\233\236\350\275\246\344\275\277\347\224\250\351\273\230\350\256\244 data/records.csv\357\274\211\357\274\232\0"
	.align 8
.LC52:
	.ascii "\345\256\271\345\231\250\351\207\215\345\273\272\345\244\261\350\264\245\357\274\214\350\257\267\346\243\200\346\237\245\345\206\205\345\255\230\343\200\202\12\0"
.LC53:
	.ascii "\346\210\220\345\212\237\345\212\240\350\275\275 %d \346\235\241\350\256\260\345\275\225\343\200\202\12\0"
	.align 8
.LC54:
	.ascii "\345\212\240\350\275\275\345\244\261\350\264\245\357\274\214\350\257\267\346\243\200\346\237\245\346\226\207\344\273\266\350\267\257\345\276\204\345\222\214\346\240\274\345\274\217\343\200\202\12\0"
	.text
	.def	load_data;	.scl	3;	.type	32;	.endef
	.seh_proc	load_data
load_data:
.LFB4295:
	.loc 2 276 29
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	subq	$304, %rsp
	.seh_stackalloc	304
	.cfi_def_cfa_offset 320
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 192
	.seh_endprologue
	.loc 2 277 9
	movq	g_container(%rip), %rax
	.loc 2 277 8
	testq	%rax, %rax
	je	.L95
	.loc 2 277 25 discriminator 1
	movq	g_iface(%rip), %rax
	.loc 2 277 22 discriminator 1
	testq	%rax, %rax
	jne	.L96
.L95:
	.loc 2 278 9
	leaq	.LC50(%rip), %rcx
	call	print_utf8_printf
	.loc 2 279 9
	jmp	.L94
.L96:
	.loc 2 283 5
	leaq	-96(%rbp), %rax
	movl	$0, %r9d
	movl	$256, %r8d
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rcx
	call	read_string
	.loc 2 285 16
	leaq	-96(%rbp), %rax
	.loc 2 285 23
	movzbl	(%rax), %eax
	.loc 2 285 8
	testb	%al, %al
	je	.L98
	.loc 2 286 9
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	leaq	g_current_file(%rip), %rcx
	call	strcpy
.L98:
	.loc 2 289 9
	movq	g_container(%rip), %rax
	.loc 2 289 8
	testq	%rax, %rax
	je	.L99
	.loc 2 289 21 discriminator 1
	movq	g_iface(%rip), %rax
	testq	%rax, %rax
	je	.L99
	.loc 2 290 16
	movq	g_iface(%rip), %rax
	movq	8(%rax), %rax
	.loc 2 290 9
	movq	g_container(%rip), %rdx
	movq	%rdx, %rcx
	call	*%rax
.LVL10:
	.loc 2 291 30
	movq	g_iface(%rip), %rax
	movq	(%rax), %rax
	.loc 2 291 23
	call	*%rax
.LVL11:
	.loc 2 291 21
	movq	%rax, g_container(%rip)
	.loc 2 292 13
	movq	g_container(%rip), %rax
	.loc 2 292 12
	testq	%rax, %rax
	jne	.L99
	.loc 2 293 13
	leaq	.LC52(%rip), %rcx
	call	print_utf8_printf
	.loc 2 294 21
	movq	$0, g_iface(%rip)
	.loc 2 295 13
	jmp	.L94
.L99:
	.loc 2 299 18
	movq	g_iface(%rip), %rdx
	movq	g_container(%rip), %rax
	movq	%rdx, %r8
	leaq	g_current_file(%rip), %rdx
	movq	%rax, %rcx
	call	load_from_csv
	movl	%eax, 172(%rbp)
	.loc 2 300 8
	cmpl	$0, 172(%rbp)
	js	.L100
	.loc 2 301 9
	movl	172(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC53(%rip), %rcx
	call	print_utf8_printf
	jmp	.L94
.L100:
	.loc 2 303 9
	leaq	.LC54(%rip), %rcx
	call	print_utf8_printf
	nop
.L94:
	.loc 2 305 1
	addq	$304, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -296
	ret
	.cfi_endproc
.LFE4295:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC55:
	.ascii "\350\257\267\345\205\210\351\200\211\346\213\251\346\225\260\346\215\256\347\273\223\346\236\204\345\271\266\345\212\240\350\275\275\346\225\260\346\215\256\357\274\201\12\0"
	.align 8
.LC56:
	.ascii "\346\210\220\345\212\237\344\277\235\345\255\230 %d \346\235\241\350\256\260\345\275\225\345\210\260 %s\343\200\202\12\0"
	.align 8
.LC57:
	.ascii "\344\277\235\345\255\230\345\244\261\350\264\245\357\274\214\350\257\267\346\243\200\346\237\245\346\226\207\344\273\266\346\235\203\351\231\220\346\210\226\347\243\201\347\233\230\347\251\272\351\227\264\343\200\202\12\0"
	.text
	.def	save_data;	.scl	3;	.type	32;	.endef
	.seh_proc	save_data
save_data:
.LFB4296:
	.loc 2 307 29
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	.loc 2 308 9
	movq	g_container(%rip), %rax
	.loc 2 308 8
	testq	%rax, %rax
	je	.L104
	.loc 2 308 25 discriminator 1
	movq	g_iface(%rip), %rax
	.loc 2 308 22 discriminator 1
	testq	%rax, %rax
	jne	.L105
.L104:
	.loc 2 309 9
	leaq	.LC55(%rip), %rcx
	call	print_utf8_printf
	.loc 2 310 9
	jmp	.L103
.L105:
	.loc 2 313 17
	movq	g_iface(%rip), %rdx
	movq	g_container(%rip), %rax
	movq	%rdx, %r8
	leaq	g_current_file(%rip), %rdx
	movq	%rax, %rcx
	call	save_to_csv
	movl	%eax, -4(%rbp)
	.loc 2 314 8
	cmpl	$0, -4(%rbp)
	js	.L107
	.loc 2 315 9
	movl	-4(%rbp), %eax
	leaq	g_current_file(%rip), %r8
	movl	%eax, %edx
	leaq	.LC56(%rip), %rcx
	call	print_utf8_printf
	jmp	.L103
.L107:
	.loc 2 317 9
	leaq	.LC57(%rip), %rcx
	call	print_utf8_printf
	nop
.L103:
	.loc 2 319 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4296:
	.seh_endproc
	.section .rdata,"dr"
.LC58:
	.ascii "\350\257\267\350\276\223\345\205\245\345\255\246\345\217\267\357\274\210"
	.ascii "12\344\275\215\357\274\211\357\274\232\0"
.LC59:
	.ascii "\350\257\267\350\276\223\345\205\245\345\247\223\345\220\215\357\274\232\0"
.LC60:
	.ascii "\350\257\267\350\276\223\345\205\245\345\255\246\351\231\242\357\274\232\0"
	.align 8
.LC61:
	.ascii "\350\257\267\350\276\223\345\205\245\350\257\276\347\250\213\347\274\226\345\217\267\357\274\210"
	.ascii "8\344\275\215\357\274\211\357\274\232\0"
.LC62:
	.ascii "\350\257\267\350\276\223\345\205\245\350\257\276\347\250\213\345\220\215\347\247\260\357\274\232\0"
	.align 8
.LC63:
	.ascii "\350\257\267\350\276\223\345\205\245\345\255\246\345\210\206\357\274\210\345\246\202 3.5\357\274\211\357\274\232\0"
.LC65:
	.ascii "\350\276\223\345\205\245\345\255\246\345\210\206\345\244\261\350\264\245\343\200\202\12\0"
	.align 8
.LC66:
	.ascii "\350\257\267\350\276\223\345\205\245\351\200\211\350\257\276\345\255\246\346\234\237\357\274\210\345\246\202 2024-02\357\274\211\357\274\232\0"
	.align 8
.LC67:
	.ascii "\350\257\267\350\276\223\345\205\245\351\200\211\350\257\276\346\227\245\346\234\237\357\274\210YYYY-MM-DD\357\274\211\357\274\232\0"
.LC68:
	.ascii "\350\257\267\350\276\223\345\205\245\346\210\220\347\273\251\357\274\210"
	.ascii "0-100\357\274\211\357\274\232\0"
.LC69:
	.ascii "\350\276\223\345\205\245\346\210\220\347\273\251\345\244\261\350\264\245\343\200\202\12\0"
.LC70:
	.ascii "\346\217\222\345\205\245\346\210\220\345\212\237\343\200\202\12\0"
	.align 8
.LC71:
	.ascii "\346\217\222\345\205\245\345\244\261\350\264\245\357\274\210\345\217\257\350\203\275\350\256\260\345\275\225\345\267\262\345\255\230\345\234\250\346\210\226\345\206\205\345\255\230\344\270\215\350\266\263\357\274\211\343\200\202\12\0"
	.text
	.def	insert_record;	.scl	3;	.type	32;	.endef
	.seh_proc	insert_record
insert_record:
.LFB4297:
	.loc 2 321 33
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	subq	$320, %rsp
	.seh_stackalloc	320
	.cfi_def_cfa_offset 336
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 208
	.seh_endprologue
	.loc 2 322 9
	movq	g_container(%rip), %rax
	.loc 2 322 8
	testq	%rax, %rax
	je	.L109
	.loc 2 322 25 discriminator 1
	movq	g_iface(%rip), %rax
	.loc 2 322 22 discriminator 1
	testq	%rax, %rax
	jne	.L110
.L109:
	.loc 2 323 9
	leaq	.LC50(%rip), %rcx
	call	print_utf8_printf
	.loc 2 324 9
	jmp	.L108
.L110:
	.loc 2 329 5
	leaq	-80(%rbp), %rax
	movl	$264, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
	.loc 2 330 5
	leaq	-80(%rbp), %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC58(%rip), %rcx
	call	read_string
	.loc 2 331 5
	leaq	-80(%rbp), %rax
	addq	$16, %rax
	movl	$0, %r9d
	movl	$64, %r8d
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rcx
	call	read_string
	.loc 2 332 5
	leaq	-80(%rbp), %rax
	addq	$80, %rax
	movl	$0, %r9d
	movl	$64, %r8d
	movq	%rax, %rdx
	leaq	.LC60(%rip), %rcx
	call	read_string
	.loc 2 333 5
	leaq	-80(%rbp), %rax
	addq	$144, %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC61(%rip), %rcx
	call	read_string
	.loc 2 334 5
	leaq	-80(%rbp), %rax
	addq	$160, %rax
	movl	$0, %r9d
	movl	$64, %r8d
	movq	%rax, %rdx
	leaq	.LC62(%rip), %rcx
	call	read_string
	.loc 2 335 18
	leaq	-81(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	pxor	%xmm1, %xmm1
	leaq	.LC63(%rip), %rcx
	call	read_float
	movd	%xmm0, %eax
	.loc 2 335 16
	movl	%eax, 144(%rbp)
	.loc 2 336 9
	movzbl	-81(%rbp), %eax
	xorl	$1, %eax
	.loc 2 336 8
	testb	%al, %al
	je	.L112
	.loc 2 337 9
	leaq	.LC65(%rip), %rcx
	call	print_utf8_printf
	.loc 2 338 9
	jmp	.L108
.L112:
	.loc 2 340 5
	leaq	-80(%rbp), %rax
	addq	$228, %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC66(%rip), %rcx
	call	read_string
	.loc 2 341 5
	leaq	-80(%rbp), %rax
	addq	$244, %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC67(%rip), %rcx
	call	read_string
	.loc 2 342 17
	leaq	-81(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %edx
	leaq	.LC68(%rip), %rcx
	call	read_int
	.loc 2 342 15
	movl	%eax, 180(%rbp)
	.loc 2 343 9
	movzbl	-81(%rbp), %eax
	xorl	$1, %eax
	.loc 2 343 8
	testb	%al, %al
	je	.L113
	.loc 2 344 9
	leaq	.LC69(%rip), %rcx
	call	print_utf8_printf
	.loc 2 345 9
	jmp	.L108
.L113:
	.loc 2 348 16
	movq	g_iface(%rip), %rax
	movq	16(%rax), %r8
	.loc 2 348 9
	movq	g_container(%rip), %rcx
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	call	*%r8
.LVL12:
	.loc 2 348 8
	testb	%al, %al
	je	.L114
	.loc 2 349 9
	leaq	.LC70(%rip), %rcx
	call	print_utf8_printf
	jmp	.L108
.L114:
	.loc 2 351 9
	leaq	.LC71(%rip), %rcx
	call	print_utf8_printf
	nop
.L108:
	.loc 2 353 1
	addq	$320, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -312
	ret
	.cfi_endproc
.LFE4297:
	.seh_endproc
	.section .rdata,"dr"
.LC72:
	.ascii "\350\257\267\350\276\223\345\205\245\345\255\246\345\217\267\357\274\232\0"
.LC73:
	.ascii "\350\257\267\350\276\223\345\205\245\350\257\276\347\250\213\347\274\226\345\217\267\357\274\232\0"
.LC74:
	.ascii "\345\210\240\351\231\244\346\210\220\345\212\237\343\200\202\12\0"
.LC75:
	.ascii "\346\234\252\346\211\276\345\210\260\350\257\245\350\256\260\345\275\225\343\200\202\12\0"
	.text
	.def	delete_record;	.scl	3;	.type	32;	.endef
	.seh_proc	delete_record
delete_record:
.LFB4298:
	.loc 2 355 33
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	.loc 2 356 9
	movq	g_container(%rip), %rax
	.loc 2 356 8
	testq	%rax, %rax
	je	.L118
	.loc 2 356 25 discriminator 1
	movq	g_iface(%rip), %rax
	.loc 2 356 22 discriminator 1
	testq	%rax, %rax
	jne	.L119
.L118:
	.loc 2 357 9
	leaq	.LC55(%rip), %rcx
	call	print_utf8_printf
	jmp	.L117
.L119:
	.loc 2 363 5
	leaq	-16(%rbp), %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC72(%rip), %rcx
	call	read_string
	.loc 2 364 5
	leaq	-32(%rbp), %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rcx
	call	read_string
	.loc 2 366 16
	movq	g_iface(%rip), %rax
	movq	24(%rax), %r9
	.loc 2 366 9
	movq	g_container(%rip), %rcx
	leaq	-32(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	*%r9
.LVL13:
	.loc 2 366 8
	testb	%al, %al
	je	.L121
	.loc 2 367 9
	leaq	.LC74(%rip), %rcx
	call	print_utf8_printf
	jmp	.L117
.L121:
	.loc 2 369 9
	leaq	.LC75(%rip), %rcx
	call	print_utf8_printf
	nop
.L117:
	.loc 2 371 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4298:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC76:
	.ascii "\12========== \346\211\276\345\210\260\350\256\260\345\275\225 ==========\12\0"
.LC77:
	.ascii "\345\255\246\345\217\267\357\274\232%s\12\0"
.LC78:
	.ascii "\345\247\223\345\220\215\357\274\232%s\12\0"
.LC79:
	.ascii "\345\255\246\351\231\242\357\274\232%s\12\0"
.LC80:
	.ascii "\350\257\276\347\250\213\347\274\226\345\217\267\357\274\232%s\12\0"
.LC81:
	.ascii "\350\257\276\347\250\213\345\220\215\347\247\260\357\274\232%s\12\0"
.LC82:
	.ascii "\345\255\246\345\210\206\357\274\232%.1f\12\0"
.LC83:
	.ascii "\345\255\246\346\234\237\357\274\232%s\12\0"
.LC84:
	.ascii "\346\227\245\346\234\237\357\274\232%s\12\0"
.LC85:
	.ascii "\346\210\220\347\273\251\357\274\232%d\12\0"
	.align 8
.LC86:
	.ascii "==============================\12\0"
	.text
	.def	find_record;	.scl	3;	.type	32;	.endef
	.seh_proc	find_record
find_record:
.LFB4299:
	.loc 2 373 31
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	.loc 2 374 9
	movq	g_container(%rip), %rax
	.loc 2 374 8
	testq	%rax, %rax
	je	.L124
	.loc 2 374 25 discriminator 1
	movq	g_iface(%rip), %rax
	.loc 2 374 22 discriminator 1
	testq	%rax, %rax
	jne	.L125
.L124:
	.loc 2 375 9
	leaq	.LC55(%rip), %rcx
	call	print_utf8_printf
	jmp	.L123
.L125:
	.loc 2 381 5
	leaq	-32(%rbp), %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC72(%rip), %rcx
	call	read_string
	.loc 2 382 5
	leaq	-48(%rbp), %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rcx
	call	read_string
	.loc 2 384 26
	movq	g_iface(%rip), %rax
	movq	40(%rax), %r9
	.loc 2 384 19
	movq	g_container(%rip), %rcx
	leaq	-48(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	*%r9
.LVL14:
	movq	%rax, -8(%rbp)
	.loc 2 385 8
	cmpq	$0, -8(%rbp)
	je	.L127
	.loc 2 386 9
	leaq	.LC76(%rip), %rcx
	call	print_utf8_printf
	.loc 2 387 36
	movq	-8(%rbp), %rax
	.loc 2 387 9
	movq	%rax, %rdx
	leaq	.LC77(%rip), %rcx
	call	print_utf8_printf
	.loc 2 388 36
	movq	-8(%rbp), %rax
	addq	$16, %rax
	.loc 2 388 9
	movq	%rax, %rdx
	leaq	.LC78(%rip), %rcx
	call	print_utf8_printf
	.loc 2 389 36
	movq	-8(%rbp), %rax
	addq	$80, %rax
	.loc 2 389 9
	movq	%rax, %rdx
	leaq	.LC79(%rip), %rcx
	call	print_utf8_printf
	.loc 2 390 42
	movq	-8(%rbp), %rax
	addq	$144, %rax
	.loc 2 390 9
	movq	%rax, %rdx
	leaq	.LC80(%rip), %rcx
	call	print_utf8_printf
	.loc 2 391 42
	movq	-8(%rbp), %rax
	addq	$160, %rax
	.loc 2 391 9
	movq	%rax, %rdx
	leaq	.LC81(%rip), %rcx
	call	print_utf8_printf
	.loc 2 392 38
	movq	-8(%rbp), %rax
	movss	224(%rax), %xmm0
	.loc 2 392 9
	cvtss2sd	%xmm0, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC82(%rip), %rcx
	call	print_utf8_printf
	.loc 2 393 36
	movq	-8(%rbp), %rax
	addq	$228, %rax
	.loc 2 393 9
	movq	%rax, %rdx
	leaq	.LC83(%rip), %rcx
	call	print_utf8_printf
	.loc 2 394 36
	movq	-8(%rbp), %rax
	addq	$244, %rax
	.loc 2 394 9
	movq	%rax, %rdx
	leaq	.LC84(%rip), %rcx
	call	print_utf8_printf
	.loc 2 395 9
	movq	-8(%rbp), %rax
	movl	260(%rax), %eax
	movl	%eax, %edx
	leaq	.LC85(%rip), %rcx
	call	print_utf8_printf
	.loc 2 396 9
	leaq	.LC86(%rip), %rcx
	call	print_utf8_printf
	.loc 2 397 9
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	jmp	.L123
.L127:
	.loc 2 399 9
	leaq	.LC75(%rip), %rcx
	call	print_utf8_printf
	nop
.L123:
	.loc 2 401 1
	addq	$80, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4299:
	.seh_endproc
	.section .rdata,"dr"
.LC87:
	.ascii "score\0"
.LC88:
	.ascii "student_id\0"
.LC89:
	.ascii "course_id\0"
.LC90:
	.ascii "name\0"
.LC91:
	.ascii "course_name\0"
.LC92:
	.ascii "college\0"
.LC93:
	.ascii "semester\0"
.LC94:
	.ascii "credit\0"
	.text
	.def	validate_sort_key;	.scl	3;	.type	32;	.endef
	.seh_proc	validate_sort_key
validate_sort_key:
.LFB4300:
	.loc 2 403 48
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 2 404 17
	leaq	.LC87(%rip), %rax
	movq	%rax, -80(%rbp)
	leaq	.LC88(%rip), %rax
	movq	%rax, -72(%rbp)
	leaq	.LC89(%rip), %rax
	movq	%rax, -64(%rbp)
	leaq	.LC90(%rip), %rax
	movq	%rax, -56(%rbp)
	leaq	.LC91(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	.LC92(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	.LC93(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC94(%rip), %rax
	movq	%rax, -24(%rbp)
.LBB3:
	.loc 2 405 14
	movl	$0, -4(%rbp)
	.loc 2 405 5
	jmp	.L130
.L133:
	.loc 2 406 13
	movl	-4(%rbp), %eax
	cltq
	movq	-80(%rbp,%rax,8), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	strcmp
	.loc 2 406 12
	testl	%eax, %eax
	jne	.L131
	.loc 2 407 20
	movl	$1, %eax
	jmp	.L134
.L131:
	.loc 2 405 76 discriminator 2
	addl	$1, -4(%rbp)
.L130:
	.loc 2 405 5 discriminator 1
	cmpl	$7, -4(%rbp)
	jle	.L133
.LBE3:
	.loc 2 410 12
	movl	$0, %eax
.L134:
	.loc 2 411 1 discriminator 1
	addq	$112, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4300:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC95:
	.ascii "\12===== \347\255\233\351\200\211\346\235\241\344\273\266\357\274\210\347\233\264\346\216\245\345\233\236\350\275\246\350\241\250\347\244\272\344\270\215\351\231\220\345\210\266\357\274\211 =====\12\0"
.LC96:
	.ascii "\345\255\246\345\217\267\357\274\210\347\262\276\347\241\256\345\214\271\351\205\215\357\274\211\357\274\232\0"
.LC97:
	.ascii "\345\247\223\345\220\215\357\274\210\346\250\241\347\263\212\345\214\271\351\205\215\357\274\211\357\274\232\0"
	.align 8
.LC98:
	.ascii "\350\257\276\347\250\213\345\220\215\347\247\260\357\274\210\346\250\241\347\263\212\345\214\271\351\205\215\357\274\211\357\274\232\0"
	.align 8
.LC99:
	.ascii "\345\255\246\346\234\237\357\274\210\347\262\276\347\241\256\345\214\271\351\205\215\357\274\214\345\246\202 2024-02\357\274\211\357\274\232\0"
	.align 8
.LC100:
	.ascii "\346\210\220\347\273\251\344\270\213\351\231\220\357\274\210\347\233\264\346\216\245\345\233\236\350\275\246\350\241\250\347\244\272\344\270\215\351\231\220\345\210\266\357\274\211\357\274\232\0"
	.align 8
.LC101:
	.ascii "\346\210\220\347\273\251\344\270\212\351\231\220\357\274\210\347\233\264\346\216\245\345\233\236\350\275\246\350\241\250\347\244\272\344\270\215\351\231\220\345\210\266\357\274\211\357\274\232\0"
.LC102:
	.ascii "\345\255\246\351\231\242\357\274\210\347\262\276\347\241\256\345\214\271\351\205\215\357\274\211\357\274\232\0"
.LC103:
	.ascii "\346\262\241\346\234\211\345\214\271\351\205\215\347\232\204\350\256\260\345\275\225\343\200\202\12\0"
	.align 8
.LC104:
	.ascii "\346\230\257\345\220\246\350\207\252\345\256\232\344\271\211\346\216\222\345\272\217\345\255\227\346\256\265\357\274\237(y/n)\357\274\232\0"
	.align 8
.LC105:
	.ascii "\350\257\267\350\276\223\345\205\245\347\254\254 %d \344\270\252\346\216\222\345\272\217\345\255\227\346\256\265\357\274\210score/student_id/course_id/name/course_name/college/semester/credit\357\274\214\345\233\236\350\275\246\347\273\223\346\235\237\357\274\211\357\274\232\0"
	.align 8
.LC106:
	.ascii "\346\227\240\346\225\210\345\255\227\346\256\265\357\274\232%s\357\274\214\345\267\262\345\277\275\347\225\245\343\200\202\12\0"
.LC107:
	.ascii "%s \346\216\222\345\272\217\346\226\271\345\220\221 (asc/desc)\357\274\232\0"
.LC108:
	.ascii "desc\0"
	.align 8
.LC109:
	.ascii "\12===== \347\255\233\351\200\211\346\216\222\345\272\217\347\273\223\346\236\234\357\274\210\345\205\261 %d \346\235\241\357\274\211 =====\12\0"
.LC110:
	.ascii "%d. %s %s %s %s %.1f %d\12\0"
.LC111:
	.ascii "...\357\274\210\344\273\205\346\230\276\347\244\272\345\211\215"
	.ascii "20\346\235\241\357\274\211\12\0"
	.align 8
.LC112:
	.ascii "\12\346\230\257\345\220\246\345\257\274\345\207\272\345\210\260\346\226\207\344\273\266\357\274\237(y/n)\357\274\232\0"
	.align 8
.LC113:
	.ascii "\350\257\267\350\276\223\345\205\245\346\226\207\344\273\266\345\220\215\357\274\210\345\246\202 output.csv\357\274\211\357\274\232\0"
.LC114:
	.ascii "\12\0"
.LC115:
	.ascii "\346\210\220\345\212\237\345\257\274\345\207\272\345\210\260 %s\12\0"
.LC116:
	.ascii "\345\257\274\345\207\272\345\244\261\350\264\245\343\200\202\12\0"
	.text
	.def	filter_and_sort;	.scl	3;	.type	32;	.endef
	.seh_proc	filter_and_sort
filter_and_sort:
.LFB4301:
	.loc 2 413 35
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rdi
	.seh_pushreg	%rdi
	.cfi_def_cfa_offset 24
	.cfi_offset 5, -24
	subq	$744, %rsp
	.seh_stackalloc	744
	.cfi_def_cfa_offset 768
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 640
	.seh_endprologue
	.loc 2 414 9
	movq	g_container(%rip), %rax
	.loc 2 414 8
	testq	%rax, %rax
	je	.L136
	.loc 2 414 25 discriminator 1
	movq	g_iface(%rip), %rax
	.loc 2 414 22 discriminator 1
	testq	%rax, %rax
	jne	.L137
.L136:
	.loc 2 415 9
	leaq	.LC55(%rip), %rcx
	call	print_utf8_printf
	.loc 2 416 9
	jmp	.L135
.L137:
	.loc 2 419 20
	leaq	320(%rbp), %rdx
	movl	$0, %eax
	movl	$29, %ecx
	movq	%rdx, %rdi
	rep stosq
	.loc 2 421 5
	leaq	.LC95(%rip), %rcx
	call	print_utf8_printf
	.loc 2 422 5
	leaq	320(%rbp), %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC96(%rip), %rcx
	call	read_string
	.loc 2 423 5
	leaq	320(%rbp), %rax
	addq	$16, %rax
	movl	$0, %r9d
	movl	$64, %r8d
	movq	%rax, %rdx
	leaq	.LC97(%rip), %rcx
	call	read_string
	.loc 2 424 5
	leaq	320(%rbp), %rax
	addq	$80, %rax
	movl	$0, %r9d
	movl	$64, %r8d
	movq	%rax, %rdx
	leaq	.LC98(%rip), %rcx
	call	read_string
	.loc 2 425 5
	leaq	320(%rbp), %rax
	addq	$144, %rax
	movl	$0, %r9d
	movl	$16, %r8d
	movq	%rax, %rdx
	leaq	.LC99(%rip), %rcx
	call	read_string
	.loc 2 427 26
	leaq	319(%rbp), %rax
	movq	%rax, %r9
	movl	$1, %r8d
	movl	$-1, %edx
	leaq	.LC100(%rip), %rcx
	call	read_int
	.loc 2 427 24
	movl	%eax, 480(%rbp)
	.loc 2 428 9
	movzbl	319(%rbp), %eax
	xorl	$1, %eax
	.loc 2 428 8
	testb	%al, %al
	je	.L139
	.loc 2 429 9
	leaq	.LC30(%rip), %rcx
	call	print_utf8_printf
	.loc 2 430 9
	jmp	.L135
.L139:
	.loc 2 432 26
	leaq	319(%rbp), %rax
	movq	%rax, %r9
	movl	$1, %r8d
	movl	$-1, %edx
	leaq	.LC101(%rip), %rcx
	call	read_int
	.loc 2 432 24
	movl	%eax, 484(%rbp)
	.loc 2 433 9
	movzbl	319(%rbp), %eax
	xorl	$1, %eax
	.loc 2 433 8
	testb	%al, %al
	je	.L140
	.loc 2 434 9
	leaq	.LC30(%rip), %rcx
	call	print_utf8_printf
	.loc 2 435 9
	jmp	.L135
.L140:
	.loc 2 438 5
	leaq	320(%rbp), %rax
	addq	$168, %rax
	movl	$0, %r9d
	movl	$64, %r8d
	movq	%rax, %rdx
	leaq	.LC102(%rip), %rcx
	call	read_string
	.loc 2 440 9
	movl	$0, 312(%rbp)
	.loc 2 441 24
	movq	g_iface(%rip), %rdx
	movq	g_container(%rip), %rax
	leaq	312(%rbp), %r8
	leaq	320(%rbp), %rcx
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	filter_records
	movq	%rax, 576(%rbp)
	.loc 2 442 8
	cmpq	$0, 576(%rbp)
	je	.L141
	.loc 2 442 27 discriminator 1
	movl	312(%rbp), %eax
	.loc 2 442 18 discriminator 1
	testl	%eax, %eax
	jne	.L142
.L141:
	.loc 2 443 9
	leaq	.LC103(%rip), %rcx
	call	print_utf8_printf
	.loc 2 444 12
	cmpq	$0, 576(%rbp)
	je	.L165
	.loc 2 444 22 discriminator 1
	movq	576(%rbp), %rax
	movq	%rax, %rcx
	call	free
	.loc 2 445 9 discriminator 1
	jmp	.L165
.L142:
	.loc 2 448 17
	leaq	.LC87(%rip), %rax
	movq	%rax, 288(%rbp)
	leaq	.LC88(%rip), %rax
	movq	%rax, 296(%rbp)
	.loc 2 449 10
	movb	$0, 286(%rbp)
	movb	$1, 287(%rbp)
	.loc 2 450 17
	movq	$0, 256(%rbp)
	movq	$0, 264(%rbp)
	movq	$0, 272(%rbp)
	.loc 2 451 10
	movb	$1, 253(%rbp)
	movb	$1, 254(%rbp)
	movb	$1, 255(%rbp)
	.loc 2 452 9
	movl	$0, 604(%rbp)
	.loc 2 455 5
	leaq	245(%rbp), %rax
	movl	$0, %r9d
	movl	$8, %r8d
	movq	%rax, %rdx
	leaq	.LC104(%rip), %rcx
	call	read_string
	.loc 2 456 15
	movzbl	245(%rbp), %eax
	.loc 2 456 8
	cmpb	$121, %al
	je	.L144
	.loc 2 456 35 discriminator 1
	movzbl	245(%rbp), %eax
	.loc 2 456 26 discriminator 1
	cmpb	$89, %al
	jne	.L145
.L144:
.LBB4:
	.loc 2 457 18
	movl	$0, 600(%rbp)
	.loc 2 457 9
	jmp	.L146
.L150:
.LBB5:
	.loc 2 460 13
	movl	600(%rbp), %eax
	leal	1(%rax), %edx
	leaq	-32(%rbp), %rax
	movl	%edx, %r9d
	leaq	.LC105(%rip), %r8
	movl	$256, %edx
	movq	%rax, %rcx
	call	snprintf
	.loc 2 461 13
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movl	$0, %r9d
	movl	$32, %r8d
	movq	%rax, %rcx
	call	read_string
	.loc 2 462 20
	movzbl	-64(%rbp), %eax
	.loc 2 462 16
	testb	%al, %al
	je	.L166
	.loc 2 463 18
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	validate_sort_key
	.loc 2 463 17
	xorl	$1, %eax
	.loc 2 463 16
	testb	%al, %al
	je	.L148
	.loc 2 464 17
	leaq	-64(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC106(%rip), %rcx
	call	print_utf8_printf
	jmp	.L149
.L148:
	.loc 2 467 37
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	strdup
	movq	%rax, %rdx
	.loc 2 467 35
	movl	604(%rbp), %eax
	cltq
	movq	%rdx, 256(%rbp,%rax,8)
	.loc 2 469 13
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %r9
	leaq	.LC107(%rip), %r8
	movl	$256, %edx
	movq	%rax, %rcx
	call	snprintf
	.loc 2 470 13
	leaq	227(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movl	$0, %r9d
	movl	$8, %r8d
	movq	%rax, %rcx
	call	read_string
	.loc 2 471 40
	leaq	227(%rbp), %rax
	leaq	.LC108(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	.loc 2 471 62
	testl	%eax, %eax
	setne	%al
	.loc 2 471 37
	movl	604(%rbp), %edx
	movslq	%edx, %rdx
	movb	%al, 253(%rbp,%rdx)
	.loc 2 472 23
	addl	$1, 604(%rbp)
.L149:
.LBE5:
	.loc 2 457 32 discriminator 2
	addl	$1, 600(%rbp)
.L146:
	.loc 2 457 9 discriminator 1
	cmpl	$2, 600(%rbp)
	jle	.L150
	jmp	.L145
.L166:
.LBB6:
	.loc 2 462 13
	nop
.L145:
.LBE6:
.LBE4:
	.loc 2 476 8
	cmpl	$0, 604(%rbp)
	jne	.L151
	.loc 2 477 20
	movl	$2, 604(%rbp)
	.loc 2 478 36
	movq	288(%rbp), %rax
	.loc 2 478 22
	movq	%rax, 256(%rbp)
	.loc 2 479 40
	movzbl	286(%rbp), %eax
	.loc 2 479 24
	movb	%al, 253(%rbp)
	.loc 2 480 36
	movq	296(%rbp), %rax
	.loc 2 480 22
	movq	%rax, 264(%rbp)
	.loc 2 481 40
	movzbl	287(%rbp), %eax
	.loc 2 481 24
	movb	%al, 254(%rbp)
.L151:
	.loc 2 484 5
	movl	312(%rbp), %edx
	leaq	253(%rbp), %r8
	leaq	256(%rbp), %rcx
	movq	576(%rbp), %rax
	movl	604(%rbp), %r9d
	movl	%r9d, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	multi_key_sort
	.loc 2 486 5
	movl	312(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC109(%rip), %rcx
	call	print_utf8_printf
	.loc 2 487 37
	movl	312(%rbp), %eax
	.loc 2 487 9
	movl	$20, %edx
	cmpl	$20, %eax
	cmovg	%edx, %eax
	movl	%eax, 572(%rbp)
.LBB7:
	.loc 2 488 14
	movl	$0, 596(%rbp)
	.loc 2 488 5
	jmp	.L152
.L153:
.LBB8:
	.loc 2 489 28 discriminator 3
	movl	596(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	576(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 489 17 discriminator 3
	movq	(%rax), %rax
	movq	%rax, 560(%rbp)
	.loc 2 490 9 discriminator 3
	movq	560(%rbp), %rax
	movl	260(%rax), %r8d
	.loc 2 492 30 discriminator 3
	movq	560(%rbp), %rax
	movss	224(%rax), %xmm0
	.loc 2 490 9 discriminator 3
	cvtss2sd	%xmm0, %xmm0
	.loc 2 492 17 discriminator 3
	movq	560(%rbp), %rax
	leaq	228(%rax), %rcx
	.loc 2 491 48 discriminator 3
	movq	560(%rbp), %rax
	leaq	160(%rax), %rdx
	.loc 2 491 39 discriminator 3
	movq	560(%rbp), %rax
	leaq	16(%rax), %r9
	.loc 2 491 24 discriminator 3
	movq	560(%rbp), %r10
	.loc 2 490 9 discriminator 3
	movl	596(%rbp), %eax
	addl	$1, %eax
	movl	%r8d, 56(%rsp)
	movsd	%xmm0, 48(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%r10, %r8
	movl	%eax, %edx
	leaq	.LC110(%rip), %rcx
	call	print_utf8_printf
.LBE8:
	.loc 2 488 31 discriminator 3
	addl	$1, 596(%rbp)
.L152:
	.loc 2 488 5 discriminator 1
	movl	596(%rbp), %eax
	cmpl	572(%rbp), %eax
	jl	.L153
.LBE7:
	.loc 2 494 15
	movl	312(%rbp), %eax
	.loc 2 494 8
	cmpl	$20, %eax
	jle	.L154
	.loc 2 494 21 discriminator 1
	leaq	.LC111(%rip), %rcx
	call	print_utf8_printf
.L154:
	.loc 2 497 5
	leaq	.LC112(%rip), %rcx
	call	print_utf8_printf
	.loc 2 498 5
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL15:
	movq	%rax, %rcx
	call	fflush
	.loc 2 499 5
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL16:
	movq	%rax, %rdx
	leaq	235(%rbp), %rax
	movq	%rdx, %r8
	movl	$10, %edx
	movq	%rax, %rcx
	call	fgets
	.loc 2 500 15
	movzbl	235(%rbp), %eax
	.loc 2 500 8
	cmpb	$121, %al
	je	.L155
	.loc 2 500 35 discriminator 1
	movzbl	235(%rbp), %eax
	.loc 2 500 26 discriminator 1
	cmpb	$89, %al
	jne	.L156
.L155:
.LBB9:
	.loc 2 502 9
	leaq	.LC113(%rip), %rcx
	call	print_utf8_printf
	.loc 2 503 9
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL17:
	movq	%rax, %rcx
	call	fflush
	.loc 2 504 9
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL18:
	movq	%rax, %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %r8
	movl	$256, %edx
	movq	%rax, %rcx
	call	fgets
	.loc 2 505 15
	leaq	-32(%rbp), %rax
	leaq	.LC114(%rip), %rdx
	movq	%rax, %rcx
	call	strcspn
	.loc 2 505 37
	movb	$0, -32(%rbp,%rax)
	.loc 2 506 20
	leaq	-32(%rbp), %rax
	.loc 2 506 27
	movzbl	(%rax), %eax
	.loc 2 506 12
	testb	%al, %al
	je	.L156
	.loc 2 507 17
	movl	312(%rbp), %edx
	leaq	-32(%rbp), %rcx
	movq	576(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	export_to_csv
	.loc 2 507 16
	testb	%al, %al
	je	.L158
	.loc 2 508 17
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC115(%rip), %rcx
	call	print_utf8_printf
	jmp	.L156
.L158:
	.loc 2 510 17
	leaq	.LC116(%rip), %rcx
	call	print_utf8_printf
.L156:
.LBE9:
.LBB10:
	.loc 2 515 14
	movl	$0, 592(%rbp)
	.loc 2 515 5
	jmp	.L159
.L161:
	.loc 2 516 22
	movl	592(%rbp), %eax
	cltq
	movq	256(%rbp,%rax,8), %rax
	.loc 2 516 12
	testq	%rax, %rax
	je	.L160
	.loc 2 516 38 discriminator 1
	movl	592(%rbp), %eax
	cltq
	movq	256(%rbp,%rax,8), %rdx
	.loc 2 516 57 discriminator 1
	movq	288(%rbp), %rax
	.loc 2 516 26 discriminator 1
	cmpq	%rax, %rdx
	je	.L160
	.loc 2 516 73 discriminator 2
	movl	592(%rbp), %eax
	cltq
	movq	256(%rbp,%rax,8), %rdx
	.loc 2 516 92 discriminator 2
	movq	296(%rbp), %rax
	.loc 2 516 61 discriminator 2
	cmpq	%rax, %rdx
	je	.L160
	.loc 2 517 34
	movl	592(%rbp), %eax
	cltq
	movq	256(%rbp,%rax,8), %rax
	.loc 2 517 13
	movq	%rax, %rcx
	call	free
.L160:
	.loc 2 515 37 discriminator 2
	addl	$1, 592(%rbp)
.L159:
	.loc 2 515 5 discriminator 1
	movl	592(%rbp), %eax
	cmpl	604(%rbp), %eax
	jl	.L161
.LBE10:
.LBB11:
	.loc 2 520 14
	movl	$0, 588(%rbp)
	.loc 2 520 5
	jmp	.L162
.L163:
	.loc 2 520 49 discriminator 3
	movl	588(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	576(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 520 37 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	.loc 2 520 32 discriminator 3
	addl	$1, 588(%rbp)
.L162:
	.loc 2 520 23 discriminator 1
	movl	312(%rbp), %eax
	.loc 2 520 5 discriminator 1
	cmpl	%eax, 588(%rbp)
	jl	.L163
.LBE11:
	.loc 2 521 5
	movq	576(%rbp), %rax
	movq	%rax, %rcx
	call	free
	jmp	.L135
.L165:
	.loc 2 445 9
	nop
.L135:
	.loc 2 522 1
	addq	$744, %rsp
	popq	%rdi
	.cfi_restore 5
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -728
	ret
	.cfi_endproc
.LFE4301:
	.seh_endproc
	.section .rdata,"dr"
.LC117:
	.ascii "2023-09-01\0"
.LC118:
	.ascii "\346\262\241\346\234\211\350\256\260\345\275\225\345\217\257\346\223\215\344\275\234\343\200\202\12\0"
	.align 8
.LC119:
	.ascii "\346\262\241\346\234\211\350\277\207\346\234\237\350\256\260\345\275\225\351\234\200\350\246\201\345\210\240\351\231\244\357\274\210\345\237\272\345\207\206\346\227\245\346\234\237\357\274\232"
	.ascii "2023-09-01\357\274\211\343\200\202\12\0"
	.align 8
.LC120:
	.ascii "\346\211\276\345\210\260 %d \346\235\241\350\277\207\346\234\237\350\256\260\345\275\225\357\274\210\351\200\211\350\257\276\346\227\245\346\234\237\346\227\251\344\272\216 2023-09-01\357\274\211\357\274\214\347\241\256\350\256\244\345\210\240\351\231\244\357\274\237(y/n)\357\274\232\0"
	.align 8
.LC121:
	.ascii "\346\210\220\345\212\237\345\210\240\351\231\244 %d \346\235\241\350\277\207\346\234\237\350\256\260\345\275\225\343\200\202\12\0"
.LC122:
	.ascii "\346\223\215\344\275\234\345\267\262\345\217\226\346\266\210\343\200\202\12\0"
	.text
	.def	delete_expired;	.scl	3;	.type	32;	.endef
	.seh_proc	delete_expired
delete_expired:
.LFB4302:
	.loc 2 524 34
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	.loc 2 525 9
	movq	g_container(%rip), %rax
	.loc 2 525 8
	testq	%rax, %rax
	je	.L168
	.loc 2 525 25 discriminator 1
	movq	g_iface(%rip), %rax
	.loc 2 525 22 discriminator 1
	testq	%rax, %rax
	jne	.L169
.L168:
	.loc 2 526 9
	leaq	.LC55(%rip), %rcx
	call	print_utf8_printf
	.loc 2 527 9
	jmp	.L167
.L169:
	.loc 2 530 17
	leaq	.LC117(%rip), %rax
	movq	%rax, -32(%rbp)
	.loc 2 531 9
	movl	$0, -44(%rbp)
	.loc 2 532 27
	movq	g_iface(%rip), %rax
	movq	48(%rax), %r8
	.loc 2 532 20
	movq	g_container(%rip), %rcx
	leaq	-44(%rbp), %rax
	movq	%rax, %rdx
	call	*%r8
.LVL19:
	movq	%rax, -40(%rbp)
	.loc 2 533 8
	cmpq	$0, -40(%rbp)
	je	.L171
	.loc 2 533 23 discriminator 1
	movl	-44(%rbp), %eax
	.loc 2 533 14 discriminator 1
	testl	%eax, %eax
	jne	.L172
.L171:
	.loc 2 534 9
	leaq	.LC118(%rip), %rcx
	call	print_utf8_printf
	.loc 2 535 12
	cmpq	$0, -40(%rbp)
	je	.L189
	.loc 2 535 18 discriminator 1
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	free
	.loc 2 536 9 discriminator 1
	jmp	.L189
.L172:
	.loc 2 539 9
	movl	$0, -4(%rbp)
.LBB12:
	.loc 2 540 14
	movl	$0, -8(%rbp)
	.loc 2 540 5
	jmp	.L174
.L176:
	.loc 2 541 23
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 2 541 26
	addq	$244, %rax
	.loc 2 541 13
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	strcmp
	.loc 2 541 12
	testl	%eax, %eax
	jns	.L175
	.loc 2 542 22
	addl	$1, -4(%rbp)
.L175:
	.loc 2 540 32 discriminator 2
	addl	$1, -8(%rbp)
.L174:
	.loc 2 540 23 discriminator 1
	movl	-44(%rbp), %eax
	.loc 2 540 5 discriminator 1
	cmpl	%eax, -8(%rbp)
	jl	.L176
.LBE12:
	.loc 2 546 8
	cmpl	$0, -4(%rbp)
	jne	.L177
	.loc 2 547 9
	leaq	.LC119(%rip), %rcx
	call	print_utf8_printf
.LBB13:
	.loc 2 548 18
	movl	$0, -12(%rbp)
	.loc 2 548 9
	jmp	.L178
.L179:
	.loc 2 548 49 discriminator 3
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 548 41 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	.loc 2 548 36 discriminator 3
	addl	$1, -12(%rbp)
.L178:
	.loc 2 548 27 discriminator 1
	movl	-44(%rbp), %eax
	.loc 2 548 9 discriminator 1
	cmpl	%eax, -12(%rbp)
	jl	.L179
.LBE13:
	.loc 2 549 9
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	free
	.loc 2 550 9
	jmp	.L167
.L177:
	.loc 2 553 5
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC120(%rip), %rcx
	call	print_utf8_printf
	.loc 2 555 5
	leaq	-52(%rbp), %rax
	movl	$0, %r9d
	movl	$8, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	read_string
	.loc 2 557 16
	movzbl	-52(%rbp), %eax
	.loc 2 557 8
	cmpb	$121, %al
	je	.L180
	.loc 2 557 37 discriminator 1
	movzbl	-52(%rbp), %eax
	.loc 2 557 27 discriminator 1
	cmpb	$89, %al
	jne	.L181
.L180:
.LBB14:
	.loc 2 558 13
	movl	$0, -16(%rbp)
.LBB15:
	.loc 2 559 18
	movl	$0, -20(%rbp)
	.loc 2 559 9
	jmp	.L182
.L184:
	.loc 2 560 27
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 2 560 30
	addq	$244, %rax
	.loc 2 560 17
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	strcmp
	.loc 2 560 16
	testl	%eax, %eax
	jns	.L183
	.loc 2 561 28
	movq	g_iface(%rip), %rax
	movq	24(%rax), %rax
	.loc 2 561 73
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	.loc 2 561 76
	leaq	144(%rdx), %r8
	.loc 2 561 53
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	.loc 2 561 21
	movq	g_container(%rip), %rcx
	call	*%rax
.LVL20:
	.loc 2 561 20
	testb	%al, %al
	je	.L183
	.loc 2 562 28
	addl	$1, -16(%rbp)
.L183:
	.loc 2 565 21 discriminator 2
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 565 13 discriminator 2
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	.loc 2 559 36 discriminator 2
	addl	$1, -20(%rbp)
.L182:
	.loc 2 559 27 discriminator 1
	movl	-44(%rbp), %eax
	.loc 2 559 9 discriminator 1
	cmpl	%eax, -20(%rbp)
	jl	.L184
.LBE15:
	.loc 2 567 9
	movl	-16(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC121(%rip), %rcx
	call	print_utf8_printf
.LBE14:
	.loc 2 557 49
	jmp	.L185
.L181:
.LBB16:
	.loc 2 569 18
	movl	$0, -24(%rbp)
	.loc 2 569 9
	jmp	.L186
.L187:
	.loc 2 569 49 discriminator 3
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 569 41 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	.loc 2 569 36 discriminator 3
	addl	$1, -24(%rbp)
.L186:
	.loc 2 569 27 discriminator 1
	movl	-44(%rbp), %eax
	.loc 2 569 9 discriminator 1
	cmpl	%eax, -24(%rbp)
	jl	.L187
.LBE16:
	.loc 2 570 9
	leaq	.LC122(%rip), %rcx
	call	print_utf8_printf
.L185:
	.loc 2 572 5
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	free
	jmp	.L167
.L189:
	.loc 2 536 9
	nop
.L167:
	.loc 2 573 1
	addq	$96, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4302:
	.seh_endproc
	.section .rdata,"dr"
.LC123:
	.ascii "\12===== \347\273\237\350\256\241\345\210\206\346\236\220 =====\12\0"
	.align 8
.LC124:
	.ascii "1. \346\257\217\351\227\250\350\257\276\347\250\213\351\200\211\350\257\276\344\272\272\346\225\260\344\270\216\345\256\271\351\207\217\344\275\277\347\224\250\347\216\207\12\0"
	.align 8
.LC125:
	.ascii "2. \346\257\217\344\275\215\345\255\246\347\224\237\351\200\211\350\257\276\351\227\250\346\225\260\344\270\216\346\200\273\345\255\246\345\210\206\12\0"
	.align 8
.LC126:
	.ascii "3. \345\220\204\345\255\246\351\231\242\351\200\211\350\257\276\344\272\272\346\225\260\345\210\206\345\270\203\12\0"
	.align 8
.LC127:
	.ascii "4. \346\214\211\345\255\246\346\234\237\347\273\237\350\256\241\351\200\211\350\257\276\346\200\273\344\272\272\346\225\260\344\270\216\350\257\276\347\250\213\346\225\260\12\0"
.LC128:
	.ascii "5. \350\257\276\347\250\213\346\210\220\347\273\251\345\210\206\345\270\203\347\273\237\350\256\241\12\0"
.LC129:
	.ascii "\346\227\240\346\225\210\351\200\211\351\241\271\343\200\202\12\0"
	.text
	.def	statistics_menu;	.scl	3;	.type	32;	.endef
	.seh_proc	statistics_menu
statistics_menu:
.LFB4303:
	.loc 2 575 35
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	.loc 2 576 9
	movq	g_container(%rip), %rax
	.loc 2 576 8
	testq	%rax, %rax
	je	.L191
	.loc 2 576 25 discriminator 1
	movq	g_iface(%rip), %rax
	.loc 2 576 22 discriminator 1
	testq	%rax, %rax
	jne	.L192
.L191:
	.loc 2 577 9
	leaq	.LC55(%rip), %rcx
	call	print_utf8_printf
	.loc 2 578 9
	jmp	.L190
.L192:
	.loc 2 582 5
	leaq	.LC123(%rip), %rcx
	call	print_utf8_printf
	.loc 2 583 5
	leaq	.LC124(%rip), %rcx
	call	print_utf8_printf
	.loc 2 584 5
	leaq	.LC125(%rip), %rcx
	call	print_utf8_printf
	.loc 2 585 5
	leaq	.LC126(%rip), %rcx
	call	print_utf8_printf
	.loc 2 586 5
	leaq	.LC127(%rip), %rcx
	call	print_utf8_printf
	.loc 2 587 5
	leaq	.LC128(%rip), %rcx
	call	print_utf8_printf
	.loc 2 589 14
	leaq	-5(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	read_int
	movl	%eax, -4(%rbp)
	.loc 2 590 9
	movzbl	-5(%rbp), %eax
	xorl	$1, %eax
	.loc 2 590 8
	testb	%al, %al
	je	.L194
	.loc 2 591 9
	leaq	.LC30(%rip), %rcx
	call	print_utf8_printf
	.loc 2 592 9
	jmp	.L190
.L194:
	.loc 2 595 5
	cmpl	$5, -4(%rbp)
	ja	.L195
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L197(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L197(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L197:
	.long	.L195-.L197
	.long	.L201-.L197
	.long	.L200-.L197
	.long	.L199-.L197
	.long	.L198-.L197
	.long	.L196-.L197
	.text
.L201:
	.loc 2 596 17
	movq	g_iface(%rip), %rdx
	movq	g_container(%rip), %rax
	movl	$50, %r8d
	movq	%rax, %rcx
	call	stat_course_enrollment
	.loc 2 596 9
	jmp	.L190
.L200:
	.loc 2 597 17
	movq	g_iface(%rip), %rdx
	movq	g_container(%rip), %rax
	movq	%rax, %rcx
	call	stat_student_credits
	.loc 2 597 9
	jmp	.L190
.L199:
	.loc 2 598 17
	movq	g_iface(%rip), %rdx
	movq	g_container(%rip), %rax
	movq	%rax, %rcx
	call	stat_college_distribution
	.loc 2 598 9
	jmp	.L190
.L198:
	.loc 2 599 17
	movq	g_iface(%rip), %rdx
	movq	g_container(%rip), %rax
	movq	%rax, %rcx
	call	stat_semester_trend
	.loc 2 599 9
	jmp	.L190
.L196:
	.loc 2 600 17
	movq	g_iface(%rip), %rdx
	movq	g_container(%rip), %rax
	movq	%rax, %rcx
	call	stat_score_distribution
	.loc 2 600 9
	jmp	.L190
.L195:
	.loc 2 601 18
	leaq	.LC129(%rip), %rcx
	call	print_utf8_printf
	nop
.L190:
	.loc 2 603 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4303:
	.seh_endproc
	.section .rdata,"dr"
.LC130:
	.ascii "data/generated_100.csv\0"
.LC131:
	.ascii "data/generated_1000.csv\0"
.LC132:
	.ascii "data/generated_10000.csv\0"
	.text
	.def	performance_menu;	.scl	3;	.type	32;	.endef
	.seh_proc	performance_menu
performance_menu:
.LFB4304:
	.loc 2 605 36
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	.loc 2 606 17
	leaq	.LC130(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC131(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	.LC132(%rip), %rax
	movq	%rax, -16(%rbp)
	.loc 2 611 5
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	run_performance_comparison
	.loc 2 612 1
	nop
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4304:
	.seh_endproc
.Letext0:
	.file 3 "C:/mingw64/x86_64-w64-mingw32/include/crtdefs.h"
	.file 4 "C:/mingw64/x86_64-w64-mingw32/include/locale.h"
	.file 5 "C:/mingw64/x86_64-w64-mingw32/include/ctype.h"
	.file 6 "C:/mingw64/x86_64-w64-mingw32/include/stdlib.h"
	.file 7 "C:/mingw64/x86_64-w64-mingw32/include/malloc.h"
	.file 8 "C:/mingw64/x86_64-w64-mingw32/include/time.h"
	.file 9 "C:/mingw64/x86_64-w64-mingw32/include/excpt.h"
	.file 10 "C:/mingw64/x86_64-w64-mingw32/include/minwindef.h"
	.file 11 "C:/mingw64/x86_64-w64-mingw32/include/guiddef.h"
	.file 12 "C:/mingw64/x86_64-w64-mingw32/include/winnt.h"
	.file 13 "C:/mingw64/x86_64-w64-mingw32/include/rpcdce.h"
	.file 14 "C:/mingw64/x86_64-w64-mingw32/include/wtypesbase.h"
	.file 15 "C:/mingw64/x86_64-w64-mingw32/include/unknwnbase.h"
	.file 16 "C:/mingw64/x86_64-w64-mingw32/include/objidlbase.h"
	.file 17 "C:/mingw64/x86_64-w64-mingw32/include/cguid.h"
	.file 18 "C:/mingw64/x86_64-w64-mingw32/include/wtypes.h"
	.file 19 "C:/mingw64/x86_64-w64-mingw32/include/combaseapi.h"
	.file 20 "C:/mingw64/x86_64-w64-mingw32/include/objidl.h"
	.file 21 "C:/mingw64/x86_64-w64-mingw32/include/oleidl.h"
	.file 22 "C:/mingw64/x86_64-w64-mingw32/include/servprov.h"
	.file 23 "C:/mingw64/x86_64-w64-mingw32/include/oaidl.h"
	.file 24 "C:/mingw64/x86_64-w64-mingw32/include/msxml.h"
	.file 25 "C:/mingw64/x86_64-w64-mingw32/include/urlmon.h"
	.file 26 "C:/mingw64/x86_64-w64-mingw32/include/propidl.h"
	.file 27 "C:/mingw64/x86_64-w64-mingw32/include/oleauto.h"
	.file 28 "C:/mingw64/x86_64-w64-mingw32/include/winioctl.h"
	.file 29 "C:/mingw64/x86_64-w64-mingw32/include/winsmcrd.h"
	.file 30 "C:/mingw64/x86_64-w64-mingw32/include/winscard.h"
	.file 31 "C:/mingw64/x86_64-w64-mingw32/include/commdlg.h"
	.file 32 "src/../include/common.h"
	.file 33 "<built-in>"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x5cb5
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -mtune=core2 -march=nocona -g\0"
	.byte	0xc
	.ascii "src/app.c\0"
	.ascii "C:\\code\0"
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.ascii "__builtin_va_list\0"
	.long	0x77
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x4
	.long	0x77
	.uleb128 0x5
	.ascii "size_t\0"
	.byte	0x3
	.byte	0x23
	.byte	0x2c
	.long	0x93
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x5
	.ascii "wchar_t\0"
	.byte	0x3
	.byte	0x62
	.byte	0x18
	.long	0xce
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x4
	.long	0xce
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x6
	.ascii "pthreadlocinfo\0"
	.byte	0x3
	.word	0x1a8
	.byte	0x28
	.long	0x114
	.uleb128 0x7
	.byte	0x8
	.long	0x11a
	.uleb128 0x8
	.ascii "threadlocaleinfostruct\0"
	.word	0x160
	.byte	0x3
	.word	0x1bc
	.byte	0x10
	.long	0x2c4
	.uleb128 0x9
	.secrel32	.LASF0
	.byte	0x3
	.word	0x1bd
	.byte	0x7
	.long	0xe9
	.byte	0
	.uleb128 0xa
	.ascii "lc_codepage\0"
	.byte	0x3
	.word	0x1be
	.byte	0x10
	.long	0x416
	.byte	0x4
	.uleb128 0xa
	.ascii "lc_collate_cp\0"
	.byte	0x3
	.word	0x1bf
	.byte	0x10
	.long	0x416
	.byte	0x8
	.uleb128 0xa
	.ascii "lc_handle\0"
	.byte	0x3
	.word	0x1c0
	.byte	0x11
	.long	0x426
	.byte	0xc
	.uleb128 0xa
	.ascii "lc_id\0"
	.byte	0x3
	.word	0x1c1
	.byte	0x9
	.long	0x44b
	.byte	0x24
	.uleb128 0xa
	.ascii "lc_category\0"
	.byte	0x3
	.word	0x1c7
	.byte	0x5
	.long	0x45b
	.byte	0x48
	.uleb128 0xb
	.ascii "lc_clike\0"
	.byte	0x3
	.word	0x1c8
	.byte	0x7
	.long	0xe9
	.word	0x108
	.uleb128 0xb
	.ascii "mb_cur_max\0"
	.byte	0x3
	.word	0x1c9
	.byte	0x7
	.long	0xe9
	.word	0x10c
	.uleb128 0xb
	.ascii "lconv_intl_refcount\0"
	.byte	0x3
	.word	0x1ca
	.byte	0x8
	.long	0x410
	.word	0x110
	.uleb128 0xb
	.ascii "lconv_num_refcount\0"
	.byte	0x3
	.word	0x1cb
	.byte	0x8
	.long	0x410
	.word	0x118
	.uleb128 0xb
	.ascii "lconv_mon_refcount\0"
	.byte	0x3
	.word	0x1cc
	.byte	0x8
	.long	0x410
	.word	0x120
	.uleb128 0xb
	.ascii "lconv\0"
	.byte	0x3
	.word	0x1cd
	.byte	0x11
	.long	0x61d
	.word	0x128
	.uleb128 0xb
	.ascii "ctype1_refcount\0"
	.byte	0x3
	.word	0x1ce
	.byte	0x8
	.long	0x410
	.word	0x130
	.uleb128 0xb
	.ascii "ctype1\0"
	.byte	0x3
	.word	0x1cf
	.byte	0x13
	.long	0x623
	.word	0x138
	.uleb128 0xb
	.ascii "pctype\0"
	.byte	0x3
	.word	0x1d0
	.byte	0x19
	.long	0x629
	.word	0x140
	.uleb128 0xb
	.ascii "pclmap\0"
	.byte	0x3
	.word	0x1d1
	.byte	0x18
	.long	0x62f
	.word	0x148
	.uleb128 0xb
	.ascii "pcumap\0"
	.byte	0x3
	.word	0x1d2
	.byte	0x18
	.long	0x62f
	.word	0x150
	.uleb128 0xb
	.ascii "lc_time_curr\0"
	.byte	0x3
	.word	0x1d3
	.byte	0x1a
	.long	0x65b
	.word	0x158
	.byte	0
	.uleb128 0x6
	.ascii "pthreadmbcinfo\0"
	.byte	0x3
	.word	0x1a9
	.byte	0x25
	.long	0x2dc
	.uleb128 0x7
	.byte	0x8
	.long	0x2e2
	.uleb128 0xc
	.ascii "threadmbcinfostruct\0"
	.uleb128 0xd
	.ascii "localeinfo_struct\0"
	.byte	0x10
	.byte	0x3
	.word	0x1ac
	.byte	0x10
	.long	0x338
	.uleb128 0xa
	.ascii "locinfo\0"
	.byte	0x3
	.word	0x1ad
	.byte	0x12
	.long	0xfc
	.byte	0
	.uleb128 0xa
	.ascii "mbcinfo\0"
	.byte	0x3
	.word	0x1ae
	.byte	0x12
	.long	0x2c4
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "_locale_tstruct\0"
	.byte	0x3
	.word	0x1af
	.byte	0x3
	.long	0x2f7
	.uleb128 0xd
	.ascii "tagLC_ID\0"
	.byte	0x6
	.byte	0x3
	.word	0x1b3
	.byte	0x10
	.long	0x3a0
	.uleb128 0xa
	.ascii "wLanguage\0"
	.byte	0x3
	.word	0x1b4
	.byte	0x12
	.long	0xce
	.byte	0
	.uleb128 0xa
	.ascii "wCountry\0"
	.byte	0x3
	.word	0x1b5
	.byte	0x12
	.long	0xce
	.byte	0x2
	.uleb128 0xa
	.ascii "wCodePage\0"
	.byte	0x3
	.word	0x1b6
	.byte	0x12
	.long	0xce
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.ascii "LC_ID\0"
	.byte	0x3
	.word	0x1b7
	.byte	0x3
	.long	0x351
	.uleb128 0xe
	.byte	0x20
	.byte	0x3
	.word	0x1c2
	.byte	0x3
	.long	0x3ff
	.uleb128 0xa
	.ascii "locale\0"
	.byte	0x3
	.word	0x1c3
	.byte	0xb
	.long	0x3ff
	.byte	0
	.uleb128 0xa
	.ascii "wlocale\0"
	.byte	0x3
	.word	0x1c4
	.byte	0xe
	.long	0x40a
	.byte	0x8
	.uleb128 0x9
	.secrel32	.LASF0
	.byte	0x3
	.word	0x1c5
	.byte	0xa
	.long	0x410
	.byte	0x10
	.uleb128 0xa
	.ascii "wrefcount\0"
	.byte	0x3
	.word	0x1c6
	.byte	0xa
	.long	0x410
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x77
	.uleb128 0xf
	.long	0x3ff
	.uleb128 0x7
	.byte	0x8
	.long	0xbe
	.uleb128 0x7
	.byte	0x8
	.long	0xe9
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x10
	.long	0x436
	.long	0x436
	.uleb128 0x11
	.long	0x93
	.byte	0x5
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x10
	.long	0x3a0
	.long	0x45b
	.uleb128 0x11
	.long	0x93
	.byte	0x5
	.byte	0
	.uleb128 0x10
	.long	0x3af
	.long	0x46b
	.uleb128 0x11
	.long	0x93
	.byte	0x5
	.byte	0
	.uleb128 0x12
	.ascii "lconv\0"
	.byte	0x58
	.byte	0x4
	.byte	0x2d
	.byte	0xa
	.long	0x61d
	.uleb128 0x13
	.ascii "decimal_point\0"
	.byte	0x4
	.byte	0x2e
	.byte	0xb
	.long	0x3ff
	.byte	0
	.uleb128 0x13
	.ascii "thousands_sep\0"
	.byte	0x4
	.byte	0x2f
	.byte	0xb
	.long	0x3ff
	.byte	0x8
	.uleb128 0x13
	.ascii "grouping\0"
	.byte	0x4
	.byte	0x30
	.byte	0xb
	.long	0x3ff
	.byte	0x10
	.uleb128 0x13
	.ascii "int_curr_symbol\0"
	.byte	0x4
	.byte	0x31
	.byte	0xb
	.long	0x3ff
	.byte	0x18
	.uleb128 0x13
	.ascii "currency_symbol\0"
	.byte	0x4
	.byte	0x32
	.byte	0xb
	.long	0x3ff
	.byte	0x20
	.uleb128 0x13
	.ascii "mon_decimal_point\0"
	.byte	0x4
	.byte	0x33
	.byte	0xb
	.long	0x3ff
	.byte	0x28
	.uleb128 0x13
	.ascii "mon_thousands_sep\0"
	.byte	0x4
	.byte	0x34
	.byte	0xb
	.long	0x3ff
	.byte	0x30
	.uleb128 0x13
	.ascii "mon_grouping\0"
	.byte	0x4
	.byte	0x35
	.byte	0xb
	.long	0x3ff
	.byte	0x38
	.uleb128 0x13
	.ascii "positive_sign\0"
	.byte	0x4
	.byte	0x36
	.byte	0xb
	.long	0x3ff
	.byte	0x40
	.uleb128 0x13
	.ascii "negative_sign\0"
	.byte	0x4
	.byte	0x37
	.byte	0xb
	.long	0x3ff
	.byte	0x48
	.uleb128 0x13
	.ascii "int_frac_digits\0"
	.byte	0x4
	.byte	0x38
	.byte	0xa
	.long	0x77
	.byte	0x50
	.uleb128 0x13
	.ascii "frac_digits\0"
	.byte	0x4
	.byte	0x39
	.byte	0xa
	.long	0x77
	.byte	0x51
	.uleb128 0x13
	.ascii "p_cs_precedes\0"
	.byte	0x4
	.byte	0x3a
	.byte	0xa
	.long	0x77
	.byte	0x52
	.uleb128 0x13
	.ascii "p_sep_by_space\0"
	.byte	0x4
	.byte	0x3b
	.byte	0xa
	.long	0x77
	.byte	0x53
	.uleb128 0x13
	.ascii "n_cs_precedes\0"
	.byte	0x4
	.byte	0x3c
	.byte	0xa
	.long	0x77
	.byte	0x54
	.uleb128 0x13
	.ascii "n_sep_by_space\0"
	.byte	0x4
	.byte	0x3d
	.byte	0xa
	.long	0x77
	.byte	0x55
	.uleb128 0x13
	.ascii "p_sign_posn\0"
	.byte	0x4
	.byte	0x3e
	.byte	0xa
	.long	0x77
	.byte	0x56
	.uleb128 0x13
	.ascii "n_sign_posn\0"
	.byte	0x4
	.byte	0x3f
	.byte	0xa
	.long	0x77
	.byte	0x57
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x46b
	.uleb128 0x7
	.byte	0x8
	.long	0xce
	.uleb128 0x7
	.byte	0x8
	.long	0xe4
	.uleb128 0x7
	.byte	0x8
	.long	0x646
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x4
	.long	0x635
	.uleb128 0xc
	.ascii "__lc_time_data\0"
	.uleb128 0x7
	.byte	0x8
	.long	0x64b
	.uleb128 0x14
	.ascii "__imp__pctype\0"
	.byte	0x5
	.byte	0x2b
	.byte	0x1c
	.long	0x677
	.uleb128 0x7
	.byte	0x8
	.long	0x623
	.uleb128 0x14
	.ascii "__imp__wctype\0"
	.byte	0x5
	.byte	0x3b
	.byte	0x1c
	.long	0x677
	.uleb128 0x14
	.ascii "__imp__pwctype\0"
	.byte	0x5
	.byte	0x47
	.byte	0x1c
	.long	0x677
	.uleb128 0x10
	.long	0x646
	.long	0x6b5
	.uleb128 0x15
	.byte	0
	.uleb128 0x4
	.long	0x6aa
	.uleb128 0x14
	.ascii "__newclmap\0"
	.byte	0x5
	.byte	0x50
	.byte	0x1e
	.long	0x6b5
	.uleb128 0x14
	.ascii "__newcumap\0"
	.byte	0x5
	.byte	0x51
	.byte	0x1e
	.long	0x6b5
	.uleb128 0x14
	.ascii "__ptlocinfo\0"
	.byte	0x5
	.byte	0x52
	.byte	0x19
	.long	0xfc
	.uleb128 0x14
	.ascii "__ptmbcinfo\0"
	.byte	0x5
	.byte	0x53
	.byte	0x19
	.long	0x2c4
	.uleb128 0x14
	.ascii "__globallocalestatus\0"
	.byte	0x5
	.byte	0x54
	.byte	0xe
	.long	0xe9
	.uleb128 0x14
	.ascii "__locale_changed\0"
	.byte	0x5
	.byte	0x55
	.byte	0xe
	.long	0xe9
	.uleb128 0x14
	.ascii "__initiallocinfo\0"
	.byte	0x5
	.byte	0x56
	.byte	0x28
	.long	0x11a
	.uleb128 0x14
	.ascii "__initiallocalestructinfo\0"
	.byte	0x5
	.byte	0x57
	.byte	0x1a
	.long	0x338
	.uleb128 0x14
	.ascii "__imp___mb_cur_max\0"
	.byte	0x5
	.byte	0xcb
	.byte	0x10
	.long	0x410
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x10
	.long	0x3ff
	.long	0x7c6
	.uleb128 0x11
	.long	0x93
	.byte	0
	.byte	0
	.uleb128 0x14
	.ascii "_sys_errlist\0"
	.byte	0x6
	.byte	0xac
	.byte	0x26
	.long	0x7b6
	.uleb128 0x14
	.ascii "_sys_nerr\0"
	.byte	0x6
	.byte	0xad
	.byte	0x24
	.long	0xe9
	.uleb128 0x16
	.ascii "__imp___argc\0"
	.byte	0x6
	.word	0x119
	.byte	0x10
	.long	0x410
	.uleb128 0x16
	.ascii "__imp___argv\0"
	.byte	0x6
	.word	0x11d
	.byte	0x13
	.long	0x819
	.uleb128 0x7
	.byte	0x8
	.long	0x81f
	.uleb128 0x7
	.byte	0x8
	.long	0x3ff
	.uleb128 0x16
	.ascii "__imp___wargv\0"
	.byte	0x6
	.word	0x121
	.byte	0x16
	.long	0x83c
	.uleb128 0x7
	.byte	0x8
	.long	0x842
	.uleb128 0x7
	.byte	0x8
	.long	0x40a
	.uleb128 0x16
	.ascii "__imp__environ\0"
	.byte	0x6
	.word	0x127
	.byte	0x13
	.long	0x819
	.uleb128 0x16
	.ascii "__imp__wenviron\0"
	.byte	0x6
	.word	0x12c
	.byte	0x16
	.long	0x83c
	.uleb128 0x16
	.ascii "__imp__pgmptr\0"
	.byte	0x6
	.word	0x132
	.byte	0x12
	.long	0x81f
	.uleb128 0x16
	.ascii "__imp__wpgmptr\0"
	.byte	0x6
	.word	0x137
	.byte	0x15
	.long	0x842
	.uleb128 0x16
	.ascii "__imp__osplatform\0"
	.byte	0x6
	.word	0x13c
	.byte	0x19
	.long	0x8c3
	.uleb128 0x7
	.byte	0x8
	.long	0x416
	.uleb128 0x16
	.ascii "__imp__osver\0"
	.byte	0x6
	.word	0x141
	.byte	0x19
	.long	0x8c3
	.uleb128 0x16
	.ascii "__imp__winver\0"
	.byte	0x6
	.word	0x146
	.byte	0x19
	.long	0x8c3
	.uleb128 0x16
	.ascii "__imp__winmajor\0"
	.byte	0x6
	.word	0x14b
	.byte	0x19
	.long	0x8c3
	.uleb128 0x16
	.ascii "__imp__winminor\0"
	.byte	0x6
	.word	0x150
	.byte	0x19
	.long	0x8c3
	.uleb128 0x14
	.ascii "_amblksiz\0"
	.byte	0x7
	.byte	0x35
	.byte	0x17
	.long	0x416
	.uleb128 0x14
	.ascii "_daylight\0"
	.byte	0x8
	.byte	0x7a
	.byte	0x16
	.long	0xe9
	.uleb128 0x14
	.ascii "_dstbias\0"
	.byte	0x8
	.byte	0x7b
	.byte	0x17
	.long	0xf0
	.uleb128 0x14
	.ascii "_timezone\0"
	.byte	0x8
	.byte	0x7c
	.byte	0x17
	.long	0xf0
	.uleb128 0x10
	.long	0x3ff
	.long	0x97f
	.uleb128 0x11
	.long	0x93
	.byte	0x1
	.byte	0
	.uleb128 0x14
	.ascii "_tzname\0"
	.byte	0x8
	.byte	0x7d
	.byte	0x19
	.long	0x96f
	.uleb128 0x16
	.ascii "daylight\0"
	.byte	0x8
	.word	0x116
	.byte	0x16
	.long	0xe9
	.uleb128 0x16
	.ascii "timezone\0"
	.byte	0x8
	.word	0x119
	.byte	0x17
	.long	0xf0
	.uleb128 0x16
	.ascii "tzname\0"
	.byte	0x8
	.word	0x11a
	.byte	0x18
	.long	0x96f
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x5
	.ascii "_PHNDLR\0"
	.byte	0x9
	.byte	0x3f
	.byte	0x1b
	.long	0x9e0
	.uleb128 0x7
	.byte	0x8
	.long	0x9e6
	.uleb128 0x17
	.long	0x9f1
	.uleb128 0x18
	.long	0xe9
	.byte	0
	.uleb128 0x12
	.ascii "_XCPT_ACTION\0"
	.byte	0x10
	.byte	0x9
	.byte	0x41
	.byte	0xa
	.long	0xa3d
	.uleb128 0x13
	.ascii "XcptNum\0"
	.byte	0x9
	.byte	0x42
	.byte	0x13
	.long	0x436
	.byte	0
	.uleb128 0x13
	.ascii "SigNum\0"
	.byte	0x9
	.byte	0x43
	.byte	0x9
	.long	0xe9
	.byte	0x4
	.uleb128 0x13
	.ascii "XcptAction\0"
	.byte	0x9
	.byte	0x44
	.byte	0xd
	.long	0x9d0
	.byte	0x8
	.byte	0
	.uleb128 0x10
	.long	0x9f1
	.long	0xa48
	.uleb128 0x15
	.byte	0
	.uleb128 0x14
	.ascii "_XcptActTab\0"
	.byte	0x9
	.byte	0x47
	.byte	0x1e
	.long	0xa3d
	.uleb128 0x14
	.ascii "_XcptActTabCount\0"
	.byte	0x9
	.byte	0x48
	.byte	0xe
	.long	0xe9
	.uleb128 0x14
	.ascii "_XcptActTabSize\0"
	.byte	0x9
	.byte	0x49
	.byte	0xe
	.long	0xe9
	.uleb128 0x14
	.ascii "_First_FPE_Indx\0"
	.byte	0x9
	.byte	0x4a
	.byte	0xe
	.long	0xe9
	.uleb128 0x14
	.ascii "_Num_FPE\0"
	.byte	0x9
	.byte	0x4b
	.byte	0xe
	.long	0xe9
	.uleb128 0x19
	.byte	0x8
	.uleb128 0x5
	.ascii "DWORD\0"
	.byte	0xa
	.byte	0x8d
	.byte	0x1d
	.long	0x436
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x12
	.ascii "_GUID\0"
	.byte	0x10
	.byte	0xb
	.byte	0x13
	.byte	0x10
	.long	0xb21
	.uleb128 0x13
	.ascii "Data1\0"
	.byte	0xb
	.byte	0x14
	.byte	0x15
	.long	0x436
	.byte	0
	.uleb128 0x13
	.ascii "Data2\0"
	.byte	0xb
	.byte	0x15
	.byte	0x12
	.long	0xce
	.byte	0x4
	.uleb128 0x13
	.ascii "Data3\0"
	.byte	0xb
	.byte	0x16
	.byte	0x12
	.long	0xce
	.byte	0x6
	.uleb128 0x13
	.ascii "Data4\0"
	.byte	0xb
	.byte	0x17
	.byte	0x11
	.long	0xb21
	.byte	0x8
	.byte	0
	.uleb128 0x10
	.long	0x635
	.long	0xb31
	.uleb128 0x11
	.long	0x93
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.ascii "GUID\0"
	.byte	0xb
	.byte	0x18
	.byte	0x3
	.long	0xad5
	.uleb128 0x4
	.long	0xb31
	.uleb128 0x5
	.ascii "IID\0"
	.byte	0xb
	.byte	0x53
	.byte	0xe
	.long	0xb31
	.uleb128 0x4
	.long	0xb43
	.uleb128 0x5
	.ascii "CLSID\0"
	.byte	0xb
	.byte	0x5b
	.byte	0xe
	.long	0xb31
	.uleb128 0x4
	.long	0xb54
	.uleb128 0x5
	.ascii "FMTID\0"
	.byte	0xb
	.byte	0x62
	.byte	0xe
	.long	0xb31
	.uleb128 0x4
	.long	0xb67
	.uleb128 0x16
	.ascii "GUID_MAX_POWER_SAVINGS\0"
	.byte	0xc
	.word	0x13a9
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_MIN_POWER_SAVINGS\0"
	.byte	0xc
	.word	0x13aa
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_TYPICAL_POWER_SAVINGS\0"
	.byte	0xc
	.word	0x13ab
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "NO_SUBGROUP_GUID\0"
	.byte	0xc
	.word	0x13ac
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "ALL_POWERSCHEMES_GUID\0"
	.byte	0xc
	.word	0x13ad
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_POWERSCHEME_PERSONALITY\0"
	.byte	0xc
	.word	0x13ae
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_ACTIVE_POWERSCHEME\0"
	.byte	0xc
	.word	0x13af
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_IDLE_RESILIENCY_SUBGROUP\0"
	.byte	0xc
	.word	0x13b0
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_IDLE_RESILIENCY_PERIOD\0"
	.byte	0xc
	.word	0x13b1
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_DISK_COALESCING_POWERDOWN_TIMEOUT\0"
	.byte	0xc
	.word	0x13b2
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_EXECUTION_REQUIRED_REQUEST_TIMEOUT\0"
	.byte	0xc
	.word	0x13b3
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_VIDEO_SUBGROUP\0"
	.byte	0xc
	.word	0x13b4
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_VIDEO_POWERDOWN_TIMEOUT\0"
	.byte	0xc
	.word	0x13b5
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_VIDEO_ANNOYANCE_TIMEOUT\0"
	.byte	0xc
	.word	0x13b6
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_VIDEO_ADAPTIVE_PERCENT_INCREASE\0"
	.byte	0xc
	.word	0x13b7
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_VIDEO_DIM_TIMEOUT\0"
	.byte	0xc
	.word	0x13b8
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_VIDEO_ADAPTIVE_POWERDOWN\0"
	.byte	0xc
	.word	0x13b9
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_MONITOR_POWER_ON\0"
	.byte	0xc
	.word	0x13ba
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS\0"
	.byte	0xc
	.word	0x13bb
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_DEVICE_POWER_POLICY_VIDEO_DIM_BRIGHTNESS\0"
	.byte	0xc
	.word	0x13bc
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_VIDEO_CURRENT_MONITOR_BRIGHTNESS\0"
	.byte	0xc
	.word	0x13bd
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_VIDEO_ADAPTIVE_DISPLAY_BRIGHTNESS\0"
	.byte	0xc
	.word	0x13be
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_CONSOLE_DISPLAY_STATE\0"
	.byte	0xc
	.word	0x13bf
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_ALLOW_DISPLAY_REQUIRED\0"
	.byte	0xc
	.word	0x13c0
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_VIDEO_CONSOLE_LOCK_TIMEOUT\0"
	.byte	0xc
	.word	0x13c1
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_ADAPTIVE_POWER_BEHAVIOR_SUBGROUP\0"
	.byte	0xc
	.word	0x13c2
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_NON_ADAPTIVE_INPUT_TIMEOUT\0"
	.byte	0xc
	.word	0x13c3
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_DISK_SUBGROUP\0"
	.byte	0xc
	.word	0x13c4
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_DISK_POWERDOWN_TIMEOUT\0"
	.byte	0xc
	.word	0x13c5
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_DISK_IDLE_TIMEOUT\0"
	.byte	0xc
	.word	0x13c6
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_DISK_BURST_IGNORE_THRESHOLD\0"
	.byte	0xc
	.word	0x13c7
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_DISK_ADAPTIVE_POWERDOWN\0"
	.byte	0xc
	.word	0x13c8
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_SLEEP_SUBGROUP\0"
	.byte	0xc
	.word	0x13c9
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_SLEEP_IDLE_THRESHOLD\0"
	.byte	0xc
	.word	0x13ca
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_STANDBY_TIMEOUT\0"
	.byte	0xc
	.word	0x13cb
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_UNATTEND_SLEEP_TIMEOUT\0"
	.byte	0xc
	.word	0x13cc
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_HIBERNATE_TIMEOUT\0"
	.byte	0xc
	.word	0x13cd
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_HIBERNATE_FASTS4_POLICY\0"
	.byte	0xc
	.word	0x13ce
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_CRITICAL_POWER_TRANSITION\0"
	.byte	0xc
	.word	0x13cf
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_SYSTEM_AWAYMODE\0"
	.byte	0xc
	.word	0x13d0
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_ALLOW_AWAYMODE\0"
	.byte	0xc
	.word	0x13d1
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_ALLOW_STANDBY_STATES\0"
	.byte	0xc
	.word	0x13d2
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_ALLOW_RTC_WAKE\0"
	.byte	0xc
	.word	0x13d3
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_ALLOW_SYSTEM_REQUIRED\0"
	.byte	0xc
	.word	0x13d4
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_SYSTEM_BUTTON_SUBGROUP\0"
	.byte	0xc
	.word	0x13d5
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_POWERBUTTON_ACTION\0"
	.byte	0xc
	.word	0x13d6
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_SLEEPBUTTON_ACTION\0"
	.byte	0xc
	.word	0x13d7
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_USERINTERFACEBUTTON_ACTION\0"
	.byte	0xc
	.word	0x13d8
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_LIDCLOSE_ACTION\0"
	.byte	0xc
	.word	0x13d9
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_LIDOPEN_POWERSTATE\0"
	.byte	0xc
	.word	0x13da
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_SUBGROUP\0"
	.byte	0xc
	.word	0x13db
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_ACTION_0\0"
	.byte	0xc
	.word	0x13dc
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_LEVEL_0\0"
	.byte	0xc
	.word	0x13dd
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_FLAGS_0\0"
	.byte	0xc
	.word	0x13de
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_ACTION_1\0"
	.byte	0xc
	.word	0x13df
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_LEVEL_1\0"
	.byte	0xc
	.word	0x13e0
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_FLAGS_1\0"
	.byte	0xc
	.word	0x13e1
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_ACTION_2\0"
	.byte	0xc
	.word	0x13e2
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_LEVEL_2\0"
	.byte	0xc
	.word	0x13e3
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_FLAGS_2\0"
	.byte	0xc
	.word	0x13e4
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_ACTION_3\0"
	.byte	0xc
	.word	0x13e5
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_LEVEL_3\0"
	.byte	0xc
	.word	0x13e6
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_DISCHARGE_FLAGS_3\0"
	.byte	0xc
	.word	0x13e7
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_SETTINGS_SUBGROUP\0"
	.byte	0xc
	.word	0x13e8
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_THROTTLE_POLICY\0"
	.byte	0xc
	.word	0x13e9
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_THROTTLE_MAXIMUM\0"
	.byte	0xc
	.word	0x13ea
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_THROTTLE_MINIMUM\0"
	.byte	0xc
	.word	0x13eb
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_ALLOW_THROTTLING\0"
	.byte	0xc
	.word	0x13ec
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_IDLESTATE_POLICY\0"
	.byte	0xc
	.word	0x13ed
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERFSTATE_POLICY\0"
	.byte	0xc
	.word	0x13ee
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_INCREASE_THRESHOLD\0"
	.byte	0xc
	.word	0x13ef
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_DECREASE_THRESHOLD\0"
	.byte	0xc
	.word	0x13f0
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_INCREASE_POLICY\0"
	.byte	0xc
	.word	0x13f1
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_DECREASE_POLICY\0"
	.byte	0xc
	.word	0x13f2
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_INCREASE_TIME\0"
	.byte	0xc
	.word	0x13f3
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_DECREASE_TIME\0"
	.byte	0xc
	.word	0x13f4
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_TIME_CHECK\0"
	.byte	0xc
	.word	0x13f5
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_BOOST_POLICY\0"
	.byte	0xc
	.word	0x13f6
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_BOOST_MODE\0"
	.byte	0xc
	.word	0x13f7
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_IDLE_ALLOW_SCALING\0"
	.byte	0xc
	.word	0x13f8
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_IDLE_DISABLE\0"
	.byte	0xc
	.word	0x13f9
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_IDLE_STATE_MAXIMUM\0"
	.byte	0xc
	.word	0x13fa
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_IDLE_TIME_CHECK\0"
	.byte	0xc
	.word	0x13fb
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_IDLE_DEMOTE_THRESHOLD\0"
	.byte	0xc
	.word	0x13fc
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_IDLE_PROMOTE_THRESHOLD\0"
	.byte	0xc
	.word	0x13fd
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_INCREASE_THRESHOLD\0"
	.byte	0xc
	.word	0x13fe
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_DECREASE_THRESHOLD\0"
	.byte	0xc
	.word	0x13ff
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_INCREASE_POLICY\0"
	.byte	0xc
	.word	0x1400
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_DECREASE_POLICY\0"
	.byte	0xc
	.word	0x1401
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_MAX_CORES\0"
	.byte	0xc
	.word	0x1402
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_MIN_CORES\0"
	.byte	0xc
	.word	0x1403
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_INCREASE_TIME\0"
	.byte	0xc
	.word	0x1404
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_DECREASE_TIME\0"
	.byte	0xc
	.word	0x1405
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_DECREASE_FACTOR\0"
	.byte	0xc
	.word	0x1406
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_THRESHOLD\0"
	.byte	0xc
	.word	0x1407
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_AFFINITY_WEIGHTING\0"
	.byte	0xc
	.word	0x1408
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_DECREASE_FACTOR\0"
	.byte	0xc
	.word	0x1409
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_THRESHOLD\0"
	.byte	0xc
	.word	0x140a
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_WEIGHTING\0"
	.byte	0xc
	.word	0x140b
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_THRESHOLD\0"
	.byte	0xc
	.word	0x140c
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PARKING_CORE_OVERRIDE\0"
	.byte	0xc
	.word	0x140d
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PARKING_PERF_STATE\0"
	.byte	0xc
	.word	0x140e
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PARKING_CONCURRENCY_THRESHOLD\0"
	.byte	0xc
	.word	0x140f
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PARKING_HEADROOM_THRESHOLD\0"
	.byte	0xc
	.word	0x1410
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_HISTORY\0"
	.byte	0xc
	.word	0x1411
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_PERF_LATENCY_HINT\0"
	.byte	0xc
	.word	0x1412
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PROCESSOR_DISTRIBUTE_UTILITY\0"
	.byte	0xc
	.word	0x1413
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_SYSTEM_COOLING_POLICY\0"
	.byte	0xc
	.word	0x1414
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_LOCK_CONSOLE_ON_WAKE\0"
	.byte	0xc
	.word	0x1415
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_DEVICE_IDLE_POLICY\0"
	.byte	0xc
	.word	0x1416
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_ACDC_POWER_SOURCE\0"
	.byte	0xc
	.word	0x1417
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_LIDSWITCH_STATE_CHANGE\0"
	.byte	0xc
	.word	0x1418
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BATTERY_PERCENTAGE_REMAINING\0"
	.byte	0xc
	.word	0x1419
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_GLOBAL_USER_PRESENCE\0"
	.byte	0xc
	.word	0x141a
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_SESSION_DISPLAY_STATUS\0"
	.byte	0xc
	.word	0x141b
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_SESSION_USER_PRESENCE\0"
	.byte	0xc
	.word	0x141c
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_IDLE_BACKGROUND_TASK\0"
	.byte	0xc
	.word	0x141d
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_BACKGROUND_TASK_NOTIFICATION\0"
	.byte	0xc
	.word	0x141e
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_APPLAUNCH_BUTTON\0"
	.byte	0xc
	.word	0x141f
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PCIEXPRESS_SETTINGS_SUBGROUP\0"
	.byte	0xc
	.word	0x1420
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_PCIEXPRESS_ASPM_POLICY\0"
	.byte	0xc
	.word	0x1421
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_ENABLE_SWITCH_FORCED_SHUTDOWN\0"
	.byte	0xc
	.word	0x1422
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_PERFSTATE_CHANGE_GUID\0"
	.byte	0xc
	.word	0x1620
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_PERFSTATE_DOMAIN_CHANGE_GUID\0"
	.byte	0xc
	.word	0x1621
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_IDLESTATE_CHANGE_GUID\0"
	.byte	0xc
	.word	0x1622
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_PERFSTATES_DATA_GUID\0"
	.byte	0xc
	.word	0x1623
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_IDLESTATES_DATA_GUID\0"
	.byte	0xc
	.word	0x1624
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_IDLE_ACCOUNTING_GUID\0"
	.byte	0xc
	.word	0x1625
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_IDLE_ACCOUNTING_EX_GUID\0"
	.byte	0xc
	.word	0x1626
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_THERMALCONSTRAINT_GUID\0"
	.byte	0xc
	.word	0x1627
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_PERFMON_PERFSTATE_GUID\0"
	.byte	0xc
	.word	0x1628
	.byte	0x5
	.long	0xb3e
	.uleb128 0x16
	.ascii "PPM_THERMAL_POLICY_CHANGE_GUID\0"
	.byte	0xc
	.word	0x1629
	.byte	0x5
	.long	0xb3e
	.uleb128 0x5
	.ascii "RPC_IF_HANDLE\0"
	.byte	0xd
	.byte	0x42
	.byte	0x11
	.long	0xab6
	.uleb128 0x10
	.long	0x77
	.long	0x20c3
	.uleb128 0x11
	.long	0x93
	.byte	0x7
	.byte	0
	.uleb128 0x1a
	.ascii "tagCOINITBASE\0"
	.byte	0x7
	.byte	0x4
	.long	0x416
	.byte	0x13
	.byte	0x95
	.byte	0xe
	.long	0x20fb
	.uleb128 0x1b
	.ascii "COINITBASE_MULTITHREADED\0"
	.byte	0
	.byte	0
	.uleb128 0x14
	.ascii "IWinTypesBase_v0_1_c_ifspec\0"
	.byte	0xe
	.byte	0x29
	.byte	0x16
	.long	0x209d
	.uleb128 0x14
	.ascii "IWinTypesBase_v0_1_s_ifspec\0"
	.byte	0xe
	.byte	0x2a
	.byte	0x16
	.long	0x209d
	.uleb128 0x14
	.ascii "IID_IUnknown\0"
	.byte	0xf
	.byte	0x57
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "IID_AsyncIUnknown\0"
	.byte	0xf
	.byte	0xbd
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IClassFactory\0"
	.byte	0xf
	.word	0x16d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IMarshal\0"
	.byte	0x10
	.word	0x16e
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_INoMarshal\0"
	.byte	0x10
	.word	0x255
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAgileObject\0"
	.byte	0x10
	.word	0x294
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAgileReference\0"
	.byte	0x10
	.word	0x2d2
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IMarshal2\0"
	.byte	0x10
	.word	0x32d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IMalloc\0"
	.byte	0x10
	.word	0x3b2
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IStdMarshalInfo\0"
	.byte	0x10
	.word	0x469
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IExternalConnection\0"
	.byte	0x10
	.word	0x4cc
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IMultiQI\0"
	.byte	0x10
	.word	0x547
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_AsyncIMultiQI\0"
	.byte	0x10
	.word	0x59e
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternalUnknown\0"
	.byte	0x10
	.word	0x60c
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumUnknown\0"
	.byte	0x10
	.word	0x668
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumString\0"
	.byte	0x10
	.word	0x706
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ISequentialStream\0"
	.byte	0x10
	.word	0x7a2
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IStream\0"
	.byte	0x10
	.word	0x84d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRpcChannelBuffer\0"
	.byte	0x10
	.word	0x991
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRpcChannelBuffer2\0"
	.byte	0x10
	.word	0xa3b
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAsyncRpcChannelBuffer\0"
	.byte	0x10
	.word	0xabd
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRpcChannelBuffer3\0"
	.byte	0x10
	.word	0xb7f
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRpcSyntaxNegotiate\0"
	.byte	0x10
	.word	0xc99
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRpcProxyBuffer\0"
	.byte	0x10
	.word	0xcee
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRpcStubBuffer\0"
	.byte	0x10
	.word	0xd56
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPSFactoryBuffer\0"
	.byte	0x10
	.word	0xe1c
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IChannelHook\0"
	.byte	0x10
	.word	0xe9f
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IClientSecurity\0"
	.byte	0x10
	.word	0xfc3
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IServerSecurity\0"
	.byte	0x10
	.word	0x106d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRpcOptions\0"
	.byte	0x10
	.word	0x1113
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IGlobalOptions\0"
	.byte	0x10
	.word	0x11ae
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ISurrogate\0"
	.byte	0x10
	.word	0x1221
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IGlobalInterfaceTable\0"
	.byte	0x10
	.word	0x1289
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ISynchronize\0"
	.byte	0x10
	.word	0x1312
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ISynchronizeHandle\0"
	.byte	0x10
	.word	0x138c
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ISynchronizeEvent\0"
	.byte	0x10
	.word	0x13e1
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ISynchronizeContainer\0"
	.byte	0x10
	.word	0x1441
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ISynchronizeMutex\0"
	.byte	0x10
	.word	0x14af
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ICancelMethodCalls\0"
	.byte	0x10
	.word	0x151e
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAsyncManager\0"
	.byte	0x10
	.word	0x158a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ICallFactory\0"
	.byte	0x10
	.word	0x1608
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRpcHelper\0"
	.byte	0x10
	.word	0x1666
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IReleaseMarshalBuffers\0"
	.byte	0x10
	.word	0x16d1
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IWaitMultiple\0"
	.byte	0x10
	.word	0x172c
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAddrTrackingControl\0"
	.byte	0x10
	.word	0x1798
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAddrExclusionControl\0"
	.byte	0x10
	.word	0x17fd
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPipeByte\0"
	.byte	0x10
	.word	0x1868
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPipeLong\0"
	.byte	0x10
	.word	0x18d9
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPipeDouble\0"
	.byte	0x10
	.word	0x194a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IComThreadingInfo\0"
	.byte	0x10
	.word	0x1b24
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IProcessInitControl\0"
	.byte	0x10
	.word	0x1bb2
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IFastRundown\0"
	.byte	0x10
	.word	0x1c07
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IMarshalingStream\0"
	.byte	0x10
	.word	0x1c4a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ICallbackWithNoReentrancyToApplicationSTA\0"
	.byte	0x10
	.word	0x1d09
	.byte	0x16
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_NULL\0"
	.byte	0x11
	.byte	0xd
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "CATID_MARSHALER\0"
	.byte	0x11
	.byte	0xe
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IRpcChannel\0"
	.byte	0x11
	.byte	0xf
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IRpcStub\0"
	.byte	0x11
	.byte	0x10
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IStubManager\0"
	.byte	0x11
	.byte	0x11
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IRpcProxy\0"
	.byte	0x11
	.byte	0x12
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IProxyManager\0"
	.byte	0x11
	.byte	0x13
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IPSFactory\0"
	.byte	0x11
	.byte	0x14
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IInternalMoniker\0"
	.byte	0x11
	.byte	0x15
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IDfReserved1\0"
	.byte	0x11
	.byte	0x16
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IDfReserved2\0"
	.byte	0x11
	.byte	0x17
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IDfReserved3\0"
	.byte	0x11
	.byte	0x18
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "CLSID_StdMarshal\0"
	.byte	0x11
	.byte	0x19
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_AggStdMarshal\0"
	.byte	0x11
	.byte	0x1a
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_StdAsyncActManager\0"
	.byte	0x11
	.byte	0x1b
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "IID_IStub\0"
	.byte	0x11
	.byte	0x1c
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IProxy\0"
	.byte	0x11
	.byte	0x1d
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IEnumGeneric\0"
	.byte	0x11
	.byte	0x1e
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IEnumHolder\0"
	.byte	0x11
	.byte	0x1f
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IEnumCallback\0"
	.byte	0x11
	.byte	0x20
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IOleManager\0"
	.byte	0x11
	.byte	0x21
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IOlePresObj\0"
	.byte	0x11
	.byte	0x22
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IDebug\0"
	.byte	0x11
	.byte	0x23
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "IID_IDebugStream\0"
	.byte	0x11
	.byte	0x24
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "CLSID_PSGenObject\0"
	.byte	0x11
	.byte	0x25
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_PSClientSite\0"
	.byte	0x11
	.byte	0x26
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_PSClassObject\0"
	.byte	0x11
	.byte	0x27
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_PSInPlaceActive\0"
	.byte	0x11
	.byte	0x28
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_PSInPlaceFrame\0"
	.byte	0x11
	.byte	0x29
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_PSDragDrop\0"
	.byte	0x11
	.byte	0x2a
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_PSBindCtx\0"
	.byte	0x11
	.byte	0x2b
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_PSEnumerators\0"
	.byte	0x11
	.byte	0x2c
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_StaticMetafile\0"
	.byte	0x11
	.byte	0x2d
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_StaticDib\0"
	.byte	0x11
	.byte	0x2e
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CID_CDfsVolume\0"
	.byte	0x11
	.byte	0x2f
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_DCOMAccessControl\0"
	.byte	0x11
	.byte	0x30
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_GlobalOptions\0"
	.byte	0x11
	.byte	0x31
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_StdGlobalInterfaceTable\0"
	.byte	0x11
	.byte	0x32
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_ComBinding\0"
	.byte	0x11
	.byte	0x33
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_StdEvent\0"
	.byte	0x11
	.byte	0x34
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_ManualResetEvent\0"
	.byte	0x11
	.byte	0x35
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_SynchronizeContainer\0"
	.byte	0x11
	.byte	0x36
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_AddrControl\0"
	.byte	0x11
	.byte	0x37
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDFormKrnl\0"
	.byte	0x11
	.byte	0x38
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDPropertyPage\0"
	.byte	0x11
	.byte	0x39
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDFormDialog\0"
	.byte	0x11
	.byte	0x3a
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDCommandButton\0"
	.byte	0x11
	.byte	0x3b
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDComboBox\0"
	.byte	0x11
	.byte	0x3c
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDTextBox\0"
	.byte	0x11
	.byte	0x3d
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDCheckBox\0"
	.byte	0x11
	.byte	0x3e
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDLabel\0"
	.byte	0x11
	.byte	0x3f
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDOptionButton\0"
	.byte	0x11
	.byte	0x40
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDListBox\0"
	.byte	0x11
	.byte	0x41
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDScrollBar\0"
	.byte	0x11
	.byte	0x42
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDGroupBox\0"
	.byte	0x11
	.byte	0x43
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDGeneralPropertyPage\0"
	.byte	0x11
	.byte	0x44
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDGenericPropertyPage\0"
	.byte	0x11
	.byte	0x45
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDFontPropertyPage\0"
	.byte	0x11
	.byte	0x46
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDColorPropertyPage\0"
	.byte	0x11
	.byte	0x47
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDLabelPropertyPage\0"
	.byte	0x11
	.byte	0x48
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDCheckBoxPropertyPage\0"
	.byte	0x11
	.byte	0x49
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDTextBoxPropertyPage\0"
	.byte	0x11
	.byte	0x4a
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDOptionButtonPropertyPage\0"
	.byte	0x11
	.byte	0x4b
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDListBoxPropertyPage\0"
	.byte	0x11
	.byte	0x4c
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDCommandButtonPropertyPage\0"
	.byte	0x11
	.byte	0x4d
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDComboBoxPropertyPage\0"
	.byte	0x11
	.byte	0x4e
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDScrollBarPropertyPage\0"
	.byte	0x11
	.byte	0x4f
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDGroupBoxPropertyPage\0"
	.byte	0x11
	.byte	0x50
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CCDXObjectPropertyPage\0"
	.byte	0x11
	.byte	0x51
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CStdPropertyFrame\0"
	.byte	0x11
	.byte	0x52
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CFormPropertyPage\0"
	.byte	0x11
	.byte	0x53
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CGridPropertyPage\0"
	.byte	0x11
	.byte	0x54
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CWSJArticlePage\0"
	.byte	0x11
	.byte	0x55
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_CSystemPage\0"
	.byte	0x11
	.byte	0x56
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_IdentityUnmarshal\0"
	.byte	0x11
	.byte	0x57
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_InProcFreeMarshaler\0"
	.byte	0x11
	.byte	0x58
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_Picture_Metafile\0"
	.byte	0x11
	.byte	0x59
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_Picture_EnhMetafile\0"
	.byte	0x11
	.byte	0x5a
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "CLSID_Picture_Dib\0"
	.byte	0x11
	.byte	0x5b
	.byte	0x16
	.long	0xb62
	.uleb128 0x14
	.ascii "GUID_TRISTATE\0"
	.byte	0x11
	.byte	0x5c
	.byte	0x15
	.long	0xb3e
	.uleb128 0x14
	.ascii "IWinTypes_v0_1_c_ifspec\0"
	.byte	0x12
	.byte	0x28
	.byte	0x16
	.long	0x209d
	.uleb128 0x14
	.ascii "IWinTypes_v0_1_s_ifspec\0"
	.byte	0x12
	.byte	0x29
	.byte	0x16
	.long	0x209d
	.uleb128 0x1c
	.ascii "VARENUM\0"
	.byte	0x7
	.byte	0x4
	.long	0x416
	.byte	0x12
	.word	0x200
	.byte	0x6
	.long	0x3311
	.uleb128 0x1b
	.ascii "VT_EMPTY\0"
	.byte	0
	.uleb128 0x1b
	.ascii "VT_NULL\0"
	.byte	0x1
	.uleb128 0x1b
	.ascii "VT_I2\0"
	.byte	0x2
	.uleb128 0x1b
	.ascii "VT_I4\0"
	.byte	0x3
	.uleb128 0x1b
	.ascii "VT_R4\0"
	.byte	0x4
	.uleb128 0x1b
	.ascii "VT_R8\0"
	.byte	0x5
	.uleb128 0x1b
	.ascii "VT_CY\0"
	.byte	0x6
	.uleb128 0x1b
	.ascii "VT_DATE\0"
	.byte	0x7
	.uleb128 0x1b
	.ascii "VT_BSTR\0"
	.byte	0x8
	.uleb128 0x1b
	.ascii "VT_DISPATCH\0"
	.byte	0x9
	.uleb128 0x1b
	.ascii "VT_ERROR\0"
	.byte	0xa
	.uleb128 0x1b
	.ascii "VT_BOOL\0"
	.byte	0xb
	.uleb128 0x1b
	.ascii "VT_VARIANT\0"
	.byte	0xc
	.uleb128 0x1b
	.ascii "VT_UNKNOWN\0"
	.byte	0xd
	.uleb128 0x1b
	.ascii "VT_DECIMAL\0"
	.byte	0xe
	.uleb128 0x1b
	.ascii "VT_I1\0"
	.byte	0x10
	.uleb128 0x1b
	.ascii "VT_UI1\0"
	.byte	0x11
	.uleb128 0x1b
	.ascii "VT_UI2\0"
	.byte	0x12
	.uleb128 0x1b
	.ascii "VT_UI4\0"
	.byte	0x13
	.uleb128 0x1b
	.ascii "VT_I8\0"
	.byte	0x14
	.uleb128 0x1b
	.ascii "VT_UI8\0"
	.byte	0x15
	.uleb128 0x1b
	.ascii "VT_INT\0"
	.byte	0x16
	.uleb128 0x1b
	.ascii "VT_UINT\0"
	.byte	0x17
	.uleb128 0x1b
	.ascii "VT_VOID\0"
	.byte	0x18
	.uleb128 0x1b
	.ascii "VT_HRESULT\0"
	.byte	0x19
	.uleb128 0x1b
	.ascii "VT_PTR\0"
	.byte	0x1a
	.uleb128 0x1b
	.ascii "VT_SAFEARRAY\0"
	.byte	0x1b
	.uleb128 0x1b
	.ascii "VT_CARRAY\0"
	.byte	0x1c
	.uleb128 0x1b
	.ascii "VT_USERDEFINED\0"
	.byte	0x1d
	.uleb128 0x1b
	.ascii "VT_LPSTR\0"
	.byte	0x1e
	.uleb128 0x1b
	.ascii "VT_LPWSTR\0"
	.byte	0x1f
	.uleb128 0x1b
	.ascii "VT_RECORD\0"
	.byte	0x24
	.uleb128 0x1b
	.ascii "VT_INT_PTR\0"
	.byte	0x25
	.uleb128 0x1b
	.ascii "VT_UINT_PTR\0"
	.byte	0x26
	.uleb128 0x1b
	.ascii "VT_FILETIME\0"
	.byte	0x40
	.uleb128 0x1b
	.ascii "VT_BLOB\0"
	.byte	0x41
	.uleb128 0x1b
	.ascii "VT_STREAM\0"
	.byte	0x42
	.uleb128 0x1b
	.ascii "VT_STORAGE\0"
	.byte	0x43
	.uleb128 0x1b
	.ascii "VT_STREAMED_OBJECT\0"
	.byte	0x44
	.uleb128 0x1b
	.ascii "VT_STORED_OBJECT\0"
	.byte	0x45
	.uleb128 0x1b
	.ascii "VT_BLOB_OBJECT\0"
	.byte	0x46
	.uleb128 0x1b
	.ascii "VT_CF\0"
	.byte	0x47
	.uleb128 0x1b
	.ascii "VT_CLSID\0"
	.byte	0x48
	.uleb128 0x1b
	.ascii "VT_VERSIONED_STREAM\0"
	.byte	0x49
	.uleb128 0x1d
	.ascii "VT_BSTR_BLOB\0"
	.word	0xfff
	.uleb128 0x1d
	.ascii "VT_VECTOR\0"
	.word	0x1000
	.uleb128 0x1d
	.ascii "VT_ARRAY\0"
	.word	0x2000
	.uleb128 0x1d
	.ascii "VT_BYREF\0"
	.word	0x4000
	.uleb128 0x1d
	.ascii "VT_RESERVED\0"
	.word	0x8000
	.uleb128 0x1d
	.ascii "VT_ILLEGAL\0"
	.word	0xffff
	.uleb128 0x1d
	.ascii "VT_ILLEGALMASKED\0"
	.word	0xfff
	.uleb128 0x1d
	.ascii "VT_TYPEMASK\0"
	.word	0xfff
	.byte	0
	.uleb128 0x16
	.ascii "IID_IMallocSpy\0"
	.byte	0x14
	.word	0x1dbd
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IBindCtx\0"
	.byte	0x14
	.word	0x1f3a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumMoniker\0"
	.byte	0x14
	.word	0x204a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRunnableObject\0"
	.byte	0x14
	.word	0x20e8
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRunningObjectTable\0"
	.byte	0x14
	.word	0x218e
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPersist\0"
	.byte	0x14
	.word	0x2269
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPersistStream\0"
	.byte	0x14
	.word	0x22be
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IMoniker\0"
	.byte	0x14
	.word	0x236a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IROTData\0"
	.byte	0x14
	.word	0x2558
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumSTATSTG\0"
	.byte	0x14
	.word	0x25b5
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IStorage\0"
	.byte	0x14
	.word	0x2658
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPersistFile\0"
	.byte	0x14
	.word	0x2841
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPersistStorage\0"
	.byte	0x14
	.word	0x28f1
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ILockBytes\0"
	.byte	0x14
	.word	0x29b1
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumFORMATETC\0"
	.byte	0x14
	.word	0x2ac0
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumSTATDATA\0"
	.byte	0x14
	.word	0x2b6c
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRootStorage\0"
	.byte	0x14
	.word	0x2c08
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAdviseSink\0"
	.byte	0x14
	.word	0x2cb3
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_AsyncIAdviseSink\0"
	.byte	0x14
	.word	0x2d73
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAdviseSink2\0"
	.byte	0x14
	.word	0x2ea9
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_AsyncIAdviseSink2\0"
	.byte	0x14
	.word	0x2f2e
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IDataObject\0"
	.byte	0x14
	.word	0x2ff4
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IDataAdviseHolder\0"
	.byte	0x14
	.word	0x3118
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IMessageFilter\0"
	.byte	0x14
	.word	0x31d3
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "FMTID_SummaryInformation\0"
	.byte	0x14
	.word	0x325d
	.byte	0x14
	.long	0xb75
	.uleb128 0x16
	.ascii "FMTID_DocSummaryInformation\0"
	.byte	0x14
	.word	0x325f
	.byte	0x14
	.long	0xb75
	.uleb128 0x16
	.ascii "FMTID_UserDefinedProperties\0"
	.byte	0x14
	.word	0x3261
	.byte	0x14
	.long	0xb75
	.uleb128 0x16
	.ascii "FMTID_DiscardableInformation\0"
	.byte	0x14
	.word	0x3263
	.byte	0x14
	.long	0xb75
	.uleb128 0x16
	.ascii "FMTID_ImageSummaryInformation\0"
	.byte	0x14
	.word	0x3265
	.byte	0x14
	.long	0xb75
	.uleb128 0x16
	.ascii "FMTID_AudioSummaryInformation\0"
	.byte	0x14
	.word	0x3267
	.byte	0x14
	.long	0xb75
	.uleb128 0x16
	.ascii "FMTID_VideoSummaryInformation\0"
	.byte	0x14
	.word	0x3269
	.byte	0x14
	.long	0xb75
	.uleb128 0x16
	.ascii "FMTID_MediaFileSummaryInformation\0"
	.byte	0x14
	.word	0x326b
	.byte	0x14
	.long	0xb75
	.uleb128 0x16
	.ascii "IID_IClassActivator\0"
	.byte	0x14
	.word	0x3273
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IFillLockBytes\0"
	.byte	0x14
	.word	0x32d5
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IProgressNotify\0"
	.byte	0x14
	.word	0x3389
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ILayoutStorage\0"
	.byte	0x14
	.word	0x33ee
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IBlockingLock\0"
	.byte	0x14
	.word	0x3492
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ITimeAndNoticeControl\0"
	.byte	0x14
	.word	0x34f7
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOplockStorage\0"
	.byte	0x14
	.word	0x354e
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IDirectWriterLock\0"
	.byte	0x14
	.word	0x35d5
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IUrlMon\0"
	.byte	0x14
	.word	0x364d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IForegroundTransfer\0"
	.byte	0x14
	.word	0x36bc
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IThumbnailExtractor\0"
	.byte	0x14
	.word	0x3710
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IDummyHICONIncluder\0"
	.byte	0x14
	.word	0x3786
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IProcessLock\0"
	.byte	0x14
	.word	0x37e5
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ISurrogateService\0"
	.byte	0x14
	.word	0x3848
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInitializeSpy\0"
	.byte	0x14
	.word	0x38f2
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IApartmentShutdown\0"
	.byte	0x14
	.word	0x398a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "IID_IOleAdviseHolder\0"
	.byte	0x15
	.byte	0xab
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleCache\0"
	.byte	0x15
	.word	0x162
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleCache2\0"
	.byte	0x15
	.word	0x229
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleCacheControl\0"
	.byte	0x15
	.word	0x2d4
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IParseDisplayName\0"
	.byte	0x15
	.word	0x33c
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleContainer\0"
	.byte	0x15
	.word	0x39c
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleClientSite\0"
	.byte	0x15
	.word	0x417
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleObject\0"
	.byte	0x15
	.word	0x4fe
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IOLETypes_v0_0_c_ifspec\0"
	.byte	0x15
	.word	0x6fe
	.byte	0x16
	.long	0x209d
	.uleb128 0x16
	.ascii "IOLETypes_v0_0_s_ifspec\0"
	.byte	0x15
	.word	0x6ff
	.byte	0x16
	.long	0x209d
	.uleb128 0x16
	.ascii "IID_IOleWindow\0"
	.byte	0x15
	.word	0x724
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleLink\0"
	.byte	0x15
	.word	0x79a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleItemContainer\0"
	.byte	0x15
	.word	0x8bf
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleInPlaceUIWindow\0"
	.byte	0x15
	.word	0x976
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleInPlaceActiveObject\0"
	.byte	0x15
	.word	0xa1c
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleInPlaceFrame\0"
	.byte	0x15
	.word	0xaf8
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleInPlaceObject\0"
	.byte	0x15
	.word	0xbf1
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IOleInPlaceSite\0"
	.byte	0x15
	.word	0xc91
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IContinue\0"
	.byte	0x15
	.word	0xda4
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IViewObject\0"
	.byte	0x15
	.word	0xdf9
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IViewObject2\0"
	.byte	0x15
	.word	0xf2a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IDropSource\0"
	.byte	0x15
	.word	0xfd2
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IDropTarget\0"
	.byte	0x15
	.word	0x105b
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IDropSourceNotify\0"
	.byte	0x15
	.word	0x10ff
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumOLEVERB\0"
	.byte	0x15
	.word	0x1176
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "IID_IServiceProvider\0"
	.byte	0x16
	.byte	0x4d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "IOleAutomationTypes_v1_0_c_ifspec\0"
	.byte	0x17
	.byte	0xf1
	.byte	0x16
	.long	0x209d
	.uleb128 0x14
	.ascii "IOleAutomationTypes_v1_0_s_ifspec\0"
	.byte	0x17
	.byte	0xf2
	.byte	0x16
	.long	0x209d
	.uleb128 0x16
	.ascii "IID_ICreateTypeInfo\0"
	.byte	0x17
	.word	0x33b
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ICreateTypeInfo2\0"
	.byte	0x17
	.word	0x562
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ICreateTypeLib\0"
	.byte	0x17
	.word	0x7b2
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ICreateTypeLib2\0"
	.byte	0x17
	.word	0x8ba
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IDispatch\0"
	.byte	0x17
	.word	0x9b6
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumVARIANT\0"
	.byte	0x17
	.word	0xa87
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ITypeComp\0"
	.byte	0x17
	.word	0xb35
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ITypeInfo\0"
	.byte	0x17
	.word	0xbd9
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ITypeInfo2\0"
	.byte	0x17
	.word	0xe50
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ITypeLib\0"
	.byte	0x17
	.word	0x10d6
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ITypeLib2\0"
	.byte	0x17
	.word	0x123d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ITypeChangeEvents\0"
	.byte	0x17
	.word	0x1361
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IErrorInfo\0"
	.byte	0x17
	.word	0x13da
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ICreateErrorInfo\0"
	.byte	0x17
	.word	0x147d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ISupportErrorInfo\0"
	.byte	0x17
	.word	0x1520
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ITypeFactory\0"
	.byte	0x17
	.word	0x1575
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ITypeMarshal\0"
	.byte	0x17
	.word	0x15d0
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IRecordInfo\0"
	.byte	0x17
	.word	0x1684
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IErrorLog\0"
	.byte	0x17
	.word	0x1820
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPropertyBag\0"
	.byte	0x17
	.word	0x187a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "__MIDL_itf_msxml_0000_v0_0_c_ifspec\0"
	.byte	0x18
	.byte	0xeb
	.byte	0x18
	.long	0x209d
	.uleb128 0x14
	.ascii "__MIDL_itf_msxml_0000_v0_0_s_ifspec\0"
	.byte	0x18
	.byte	0xec
	.byte	0x18
	.long	0x209d
	.uleb128 0x14
	.ascii "LIBID_MSXML\0"
	.byte	0x18
	.byte	0xfc
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMImplementation\0"
	.byte	0x18
	.word	0x100
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMNode\0"
	.byte	0x18
	.word	0x127
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMDocumentFragment\0"
	.byte	0x18
	.word	0x1fd
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMDocument\0"
	.byte	0x18
	.word	0x266
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMNodeList\0"
	.byte	0x18
	.word	0x375
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMNamedNodeMap\0"
	.byte	0x18
	.word	0x3b0
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMCharacterData\0"
	.byte	0x18
	.word	0x404
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMAttribute\0"
	.byte	0x18
	.word	0x496
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMElement\0"
	.byte	0x18
	.word	0x50f
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMText\0"
	.byte	0x18
	.word	0x5a6
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMComment\0"
	.byte	0x18
	.word	0x625
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMProcessingInstruction\0"
	.byte	0x18
	.word	0x69e
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMCDATASection\0"
	.byte	0x18
	.word	0x717
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMDocumentType\0"
	.byte	0x18
	.word	0x792
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMNotation\0"
	.byte	0x18
	.word	0x80b
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMEntity\0"
	.byte	0x18
	.word	0x87f
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMEntityReference\0"
	.byte	0x18
	.word	0x8f8
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDOMParseError\0"
	.byte	0x18
	.word	0x961
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXTLRuntime\0"
	.byte	0x18
	.word	0x9a6
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "DIID_XMLDOMDocumentEvents\0"
	.byte	0x18
	.word	0xa3d
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_DOMDocument\0"
	.byte	0x18
	.word	0xa5c
	.byte	0x18
	.long	0xb62
	.uleb128 0x16
	.ascii "CLSID_DOMFreeThreadedDocument\0"
	.byte	0x18
	.word	0xa60
	.byte	0x18
	.long	0xb62
	.uleb128 0x16
	.ascii "IID_IXMLHttpRequest\0"
	.byte	0x18
	.word	0xa67
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_XMLHTTPRequest\0"
	.byte	0x18
	.word	0xacd
	.byte	0x18
	.long	0xb62
	.uleb128 0x16
	.ascii "IID_IXMLDSOControl\0"
	.byte	0x18
	.word	0xad4
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_XMLDSOControl\0"
	.byte	0x18
	.word	0xb0d
	.byte	0x18
	.long	0xb62
	.uleb128 0x16
	.ascii "IID_IXMLElementCollection\0"
	.byte	0x18
	.word	0xb14
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDocument\0"
	.byte	0x18
	.word	0xb4a
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLDocument2\0"
	.byte	0x18
	.word	0xbb2
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLElement\0"
	.byte	0x18
	.word	0xc24
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLElement2\0"
	.byte	0x18
	.word	0xc82
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLAttribute\0"
	.byte	0x18
	.word	0xce5
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IXMLError\0"
	.byte	0x18
	.word	0xd11
	.byte	0x16
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_XMLDocument\0"
	.byte	0x18
	.word	0xd2e
	.byte	0x18
	.long	0xb62
	.uleb128 0x16
	.ascii "CLSID_SBS_StdURLMoniker\0"
	.byte	0x19
	.word	0x17e
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_HttpProtocol\0"
	.byte	0x19
	.word	0x17f
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_FtpProtocol\0"
	.byte	0x19
	.word	0x180
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_GopherProtocol\0"
	.byte	0x19
	.word	0x181
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_HttpSProtocol\0"
	.byte	0x19
	.word	0x182
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_FileProtocol\0"
	.byte	0x19
	.word	0x183
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_MkProtocol\0"
	.byte	0x19
	.word	0x184
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_UrlMkBindCtx\0"
	.byte	0x19
	.word	0x185
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_SoftDistExt\0"
	.byte	0x19
	.word	0x186
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_CdlProtocol\0"
	.byte	0x19
	.word	0x187
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_ClassInstallFilter\0"
	.byte	0x19
	.word	0x188
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_InternetSecurityManager\0"
	.byte	0x19
	.word	0x189
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_SBS_InternetZoneManager\0"
	.byte	0x19
	.word	0x18a
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IAsyncMoniker\0"
	.byte	0x19
	.word	0x193
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_StdURLMoniker\0"
	.byte	0x19
	.word	0x194
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_HttpProtocol\0"
	.byte	0x19
	.word	0x195
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_FtpProtocol\0"
	.byte	0x19
	.word	0x196
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_GopherProtocol\0"
	.byte	0x19
	.word	0x197
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_HttpSProtocol\0"
	.byte	0x19
	.word	0x198
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_FileProtocol\0"
	.byte	0x19
	.word	0x199
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_MkProtocol\0"
	.byte	0x19
	.word	0x19a
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_StdURLProtocol\0"
	.byte	0x19
	.word	0x19b
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_UrlMkBindCtx\0"
	.byte	0x19
	.word	0x19c
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_CdlProtocol\0"
	.byte	0x19
	.word	0x19d
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_ClassInstallFilter\0"
	.byte	0x19
	.word	0x19e
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IAsyncBindCtx\0"
	.byte	0x19
	.word	0x19f
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IPersistMoniker\0"
	.byte	0x19
	.word	0x250
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IMonikerProp\0"
	.byte	0x19
	.word	0x321
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IBindProtocol\0"
	.byte	0x19
	.word	0x37f
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IBinding\0"
	.byte	0x19
	.word	0x3e0
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IBindStatusCallback\0"
	.byte	0x19
	.word	0x575
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IBindStatusCallbackEx\0"
	.byte	0x19
	.word	0x6a5
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAuthenticate\0"
	.byte	0x19
	.word	0x764
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IAuthenticateEx\0"
	.byte	0x19
	.word	0x7d0
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IHttpNegotiate\0"
	.byte	0x19
	.word	0x841
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IHttpNegotiate2\0"
	.byte	0x19
	.word	0x8c1
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IHttpNegotiate3\0"
	.byte	0x19
	.word	0x93b
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IWinInetFileStream\0"
	.byte	0x19
	.word	0x9bf
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IWindowForBindingUI\0"
	.byte	0x19
	.word	0xa30
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ICodeInstall\0"
	.byte	0x19
	.word	0xa9b
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IWinInetInfo\0"
	.byte	0x19
	.word	0x10a5
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IHttpSecurity\0"
	.byte	0x19
	.word	0x1112
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IWinInetHttpInfo\0"
	.byte	0x19
	.word	0x1179
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IWinInetHttpTimeouts\0"
	.byte	0x19
	.word	0x11f8
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "SID_BindHost\0"
	.byte	0x19
	.word	0x1335
	.byte	0x15
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IBindHost\0"
	.byte	0x19
	.word	0x133f
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternet\0"
	.byte	0x19
	.word	0x144d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetBindInfo\0"
	.byte	0x19
	.word	0x14ac
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetBindInfoEx\0"
	.byte	0x19
	.word	0x1526
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetProtocolRoot\0"
	.byte	0x19
	.word	0x15bf
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetProtocol\0"
	.byte	0x19
	.word	0x1684
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetProtocolSink\0"
	.byte	0x19
	.word	0x181a
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetProtocolSinkStackable\0"
	.byte	0x19
	.word	0x18bd
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetSession\0"
	.byte	0x19
	.word	0x193f
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetThreadSwitch\0"
	.byte	0x19
	.word	0x1a48
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetPriority\0"
	.byte	0x19
	.word	0x1ab2
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetProtocolInfo\0"
	.byte	0x19
	.word	0x1b4e
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "CLSID_InternetSecurityManager\0"
	.byte	0x19
	.word	0x1cb2
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "CLSID_InternetZoneManager\0"
	.byte	0x19
	.word	0x1cb3
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_IInternetSecurityMgrSite\0"
	.byte	0x19
	.word	0x1ccb
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetSecurityManager\0"
	.byte	0x19
	.word	0x1d69
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetHostSecurityManager\0"
	.byte	0x19
	.word	0x210f
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IInternetZoneManager\0"
	.byte	0x19
	.word	0x22c4
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "CLSID_SoftDistExt\0"
	.byte	0x19
	.word	0x269c
	.byte	0x14
	.long	0xb4f
	.uleb128 0x16
	.ascii "IID_ISoftDistExt\0"
	.byte	0x19
	.word	0x26cc
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_ICatalogFileInfo\0"
	.byte	0x19
	.word	0x2778
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IDataFilter\0"
	.byte	0x19
	.word	0x27e6
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEncodingFilterFactory\0"
	.byte	0x19
	.word	0x28a6
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "GUID_CUSTOM_CONFIRMOBJECTSAFETY\0"
	.byte	0x19
	.word	0x2933
	.byte	0x15
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IWrappedProtocol\0"
	.byte	0x19
	.word	0x2941
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IGetBindHandle\0"
	.byte	0x19
	.word	0x29a5
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IBindCallbackRedirect\0"
	.byte	0x19
	.word	0x2a0d
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPropertyStorage\0"
	.byte	0x1a
	.word	0x1b7
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IPropertySetStorage\0"
	.byte	0x1a
	.word	0x304
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumSTATPROPSTG\0"
	.byte	0x1a
	.word	0x3a6
	.byte	0x1
	.long	0xb3e
	.uleb128 0x16
	.ascii "IID_IEnumSTATPROPSETSTG\0"
	.byte	0x1a
	.word	0x444
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "IID_StdOle\0"
	.byte	0x1b
	.byte	0x15
	.byte	0x14
	.long	0xb4f
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_DISK\0"
	.byte	0x1c
	.byte	0xc
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_CDROM\0"
	.byte	0x1c
	.byte	0xd
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_PARTITION\0"
	.byte	0x1c
	.byte	0xe
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_TAPE\0"
	.byte	0x1c
	.byte	0xf
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_WRITEONCEDISK\0"
	.byte	0x1c
	.byte	0x10
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_VOLUME\0"
	.byte	0x1c
	.byte	0x11
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_MEDIUMCHANGER\0"
	.byte	0x1c
	.byte	0x12
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_FLOPPY\0"
	.byte	0x1c
	.byte	0x13
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_CDCHANGER\0"
	.byte	0x1c
	.byte	0x14
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_STORAGEPORT\0"
	.byte	0x1c
	.byte	0x15
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_COMPORT\0"
	.byte	0x1c
	.byte	0x16
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "GUID_DEVINTERFACE_SERENUM_BUS_ENUMERATOR\0"
	.byte	0x1c
	.byte	0x17
	.byte	0x1
	.long	0xb3e
	.uleb128 0x12
	.ascii "_SCARD_IO_REQUEST\0"
	.byte	0x8
	.byte	0x1d
	.byte	0xa1
	.byte	0x12
	.long	0x4d7e
	.uleb128 0x13
	.ascii "dwProtocol\0"
	.byte	0x1d
	.byte	0xa2
	.byte	0xb
	.long	0xab8
	.byte	0
	.uleb128 0x13
	.ascii "cbPciLength\0"
	.byte	0x1d
	.byte	0xa3
	.byte	0xb
	.long	0xab8
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.ascii "SCARD_IO_REQUEST\0"
	.byte	0x1d
	.byte	0xa4
	.byte	0x5
	.long	0x4d39
	.uleb128 0x4
	.long	0x4d7e
	.uleb128 0x14
	.ascii "g_rgSCardT0Pci\0"
	.byte	0x1e
	.byte	0x25
	.byte	0x2e
	.long	0x4d97
	.uleb128 0x14
	.ascii "g_rgSCardT1Pci\0"
	.byte	0x1e
	.byte	0x25
	.byte	0x3d
	.long	0x4d97
	.uleb128 0x14
	.ascii "g_rgSCardRawPci\0"
	.byte	0x1e
	.byte	0x25
	.byte	0x4c
	.long	0x4d97
	.uleb128 0x14
	.ascii "IID_IPrintDialogCallback\0"
	.byte	0x1f
	.byte	0xe
	.byte	0x1
	.long	0xb3e
	.uleb128 0x14
	.ascii "IID_IPrintDialogServices\0"
	.byte	0x1f
	.byte	0xf
	.byte	0x1
	.long	0xb3e
	.uleb128 0x1e
	.ascii "Record\0"
	.word	0x108
	.byte	0x20
	.byte	0x22
	.byte	0x10
	.long	0x4ebd
	.uleb128 0x1f
	.secrel32	.LASF1
	.byte	0x20
	.byte	0x23
	.byte	0xa
	.long	0x4ebd
	.byte	0
	.uleb128 0x13
	.ascii "name\0"
	.byte	0x20
	.byte	0x24
	.byte	0xa
	.long	0x4ecd
	.byte	0x10
	.uleb128 0x13
	.ascii "college\0"
	.byte	0x20
	.byte	0x25
	.byte	0xa
	.long	0x4ecd
	.byte	0x50
	.uleb128 0x13
	.ascii "course_id\0"
	.byte	0x20
	.byte	0x26
	.byte	0xa
	.long	0x4ebd
	.byte	0x90
	.uleb128 0x1f
	.secrel32	.LASF2
	.byte	0x20
	.byte	0x27
	.byte	0xa
	.long	0x4ecd
	.byte	0xa0
	.uleb128 0x13
	.ascii "credit\0"
	.byte	0x20
	.byte	0x28
	.byte	0xb
	.long	0x79e
	.byte	0xe0
	.uleb128 0x1f
	.secrel32	.LASF3
	.byte	0x20
	.byte	0x29
	.byte	0xa
	.long	0x4ebd
	.byte	0xe4
	.uleb128 0x13
	.ascii "date\0"
	.byte	0x20
	.byte	0x2a
	.byte	0xa
	.long	0x4ebd
	.byte	0xf4
	.uleb128 0x20
	.ascii "score\0"
	.byte	0x20
	.byte	0x2b
	.byte	0x9
	.long	0xe9
	.word	0x104
	.byte	0
	.uleb128 0x10
	.long	0x77
	.long	0x4ecd
	.uleb128 0x11
	.long	0x93
	.byte	0xf
	.byte	0
	.uleb128 0x10
	.long	0x77
	.long	0x4edd
	.uleb128 0x11
	.long	0x93
	.byte	0x3f
	.byte	0
	.uleb128 0x5
	.ascii "Record\0"
	.byte	0x20
	.byte	0x2c
	.byte	0x3
	.long	0x4e24
	.uleb128 0x4
	.long	0x4edd
	.uleb128 0x21
	.secrel32	.LASF4
	.byte	0xe8
	.byte	0x20
	.byte	0x33
	.byte	0x10
	.long	0x4f6b
	.uleb128 0x1f
	.secrel32	.LASF1
	.byte	0x20
	.byte	0x34
	.byte	0xa
	.long	0x4ebd
	.byte	0
	.uleb128 0x13
	.ascii "name\0"
	.byte	0x20
	.byte	0x35
	.byte	0xa
	.long	0x4ecd
	.byte	0x10
	.uleb128 0x1f
	.secrel32	.LASF2
	.byte	0x20
	.byte	0x36
	.byte	0xa
	.long	0x4ecd
	.byte	0x50
	.uleb128 0x1f
	.secrel32	.LASF3
	.byte	0x20
	.byte	0x37
	.byte	0xa
	.long	0x4ebd
	.byte	0x90
	.uleb128 0x13
	.ascii "score_min\0"
	.byte	0x20
	.byte	0x38
	.byte	0x9
	.long	0xe9
	.byte	0xa0
	.uleb128 0x13
	.ascii "score_max\0"
	.byte	0x20
	.byte	0x39
	.byte	0x9
	.long	0xe9
	.byte	0xa4
	.uleb128 0x13
	.ascii "college\0"
	.byte	0x20
	.byte	0x3a
	.byte	0xa
	.long	0x4ecd
	.byte	0xa8
	.byte	0
	.uleb128 0x22
	.secrel32	.LASF4
	.byte	0x20
	.byte	0x3b
	.byte	0x3
	.long	0x4ef1
	.uleb128 0x21
	.secrel32	.LASF5
	.byte	0x8
	.byte	0x20
	.byte	0x42
	.byte	0x10
	.long	0x4f97
	.uleb128 0x13
	.ascii "internal\0"
	.byte	0x20
	.byte	0x43
	.byte	0xb
	.long	0xab6
	.byte	0
	.byte	0
	.uleb128 0x22
	.secrel32	.LASF5
	.byte	0x20
	.byte	0x44
	.byte	0x3
	.long	0x4f77
	.uleb128 0x21
	.secrel32	.LASF6
	.byte	0x40
	.byte	0x20
	.byte	0x4b
	.byte	0x10
	.long	0x5038
	.uleb128 0x13
	.ascii "create\0"
	.byte	0x20
	.byte	0x4c
	.byte	0x16
	.long	0x5043
	.byte	0
	.uleb128 0x13
	.ascii "destroy\0"
	.byte	0x20
	.byte	0x4d
	.byte	0xc
	.long	0x5054
	.byte	0x8
	.uleb128 0x13
	.ascii "insert\0"
	.byte	0x20
	.byte	0x4e
	.byte	0xc
	.long	0x507d
	.byte	0x10
	.uleb128 0x13
	.ascii "delete\0"
	.byte	0x20
	.byte	0x4f
	.byte	0xc
	.long	0x50a7
	.byte	0x18
	.uleb128 0x13
	.ascii "update\0"
	.byte	0x20
	.byte	0x50
	.byte	0xc
	.long	0x507d
	.byte	0x20
	.uleb128 0x13
	.ascii "find\0"
	.byte	0x20
	.byte	0x51
	.byte	0xf
	.long	0x50cc
	.byte	0x28
	.uleb128 0x13
	.ascii "get_all_records\0"
	.byte	0x20
	.byte	0x52
	.byte	0x10
	.long	0x50ec
	.byte	0x30
	.uleb128 0x13
	.ascii "count\0"
	.byte	0x20
	.byte	0x53
	.byte	0xb
	.long	0x5101
	.byte	0x38
	.byte	0
	.uleb128 0x23
	.long	0x503d
	.uleb128 0x7
	.byte	0x8
	.long	0x4f97
	.uleb128 0x7
	.byte	0x8
	.long	0x5038
	.uleb128 0x17
	.long	0x5054
	.uleb128 0x18
	.long	0x503d
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x5049
	.uleb128 0x24
	.long	0x506e
	.long	0x506e
	.uleb128 0x18
	.long	0x503d
	.uleb128 0x18
	.long	0x5077
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x7
	.byte	0x8
	.long	0x4eec
	.uleb128 0x7
	.byte	0x8
	.long	0x505a
	.uleb128 0x24
	.long	0x506e
	.long	0x509c
	.uleb128 0x18
	.long	0x503d
	.uleb128 0x18
	.long	0x509c
	.uleb128 0x18
	.long	0x509c
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x7f
	.uleb128 0xf
	.long	0x509c
	.uleb128 0x7
	.byte	0x8
	.long	0x5083
	.uleb128 0x24
	.long	0x50c6
	.long	0x50c6
	.uleb128 0x18
	.long	0x503d
	.uleb128 0x18
	.long	0x509c
	.uleb128 0x18
	.long	0x509c
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x4edd
	.uleb128 0x7
	.byte	0x8
	.long	0x50ad
	.uleb128 0x24
	.long	0x50e6
	.long	0x50e6
	.uleb128 0x18
	.long	0x503d
	.uleb128 0x18
	.long	0x410
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x50c6
	.uleb128 0x7
	.byte	0x8
	.long	0x50d2
	.uleb128 0x24
	.long	0xe9
	.long	0x5101
	.uleb128 0x18
	.long	0x503d
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x50f2
	.uleb128 0x22
	.secrel32	.LASF6
	.byte	0x20
	.byte	0x54
	.byte	0x3
	.long	0x4fa3
	.uleb128 0x4
	.long	0x5107
	.uleb128 0x25
	.ascii "g_container\0"
	.byte	0x2
	.byte	0xf
	.byte	0x17
	.long	0x503d
	.uleb128 0x9
	.byte	0x3
	.quad	g_container
	.uleb128 0x25
	.ascii "g_iface\0"
	.byte	0x2
	.byte	0x10
	.byte	0x1d
	.long	0x5150
	.uleb128 0x9
	.byte	0x3
	.quad	g_iface
	.uleb128 0x7
	.byte	0x8
	.long	0x5113
	.uleb128 0x10
	.long	0x77
	.long	0x5166
	.uleb128 0x11
	.long	0x93
	.byte	0xff
	.byte	0
	.uleb128 0x25
	.ascii "g_current_file\0"
	.byte	0x2
	.byte	0x11
	.byte	0xd
	.long	0x5156
	.uleb128 0x9
	.byte	0x3
	.quad	g_current_file
	.uleb128 0x26
	.ascii "performance_menu\0"
	.byte	0x2
	.word	0x25d
	.byte	0xd
	.quad	.LFB4304
	.quad	.LFE4304-.LFB4304
	.uleb128 0x1
	.byte	0x9c
	.long	0x51c6
	.uleb128 0x27
	.ascii "files\0"
	.byte	0x2
	.word	0x25e
	.byte	0x11
	.long	0x51c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x10
	.long	0x509c
	.long	0x51d6
	.uleb128 0x11
	.long	0x93
	.byte	0x2
	.byte	0
	.uleb128 0x26
	.ascii "statistics_menu\0"
	.byte	0x2
	.word	0x23f
	.byte	0xd
	.quad	.LFB4303
	.quad	.LFE4303-.LFB4303
	.uleb128 0x1
	.byte	0x9c
	.long	0x5221
	.uleb128 0x28
	.secrel32	.LASF7
	.byte	0x2
	.word	0x245
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x27
	.ascii "ok\0"
	.byte	0x2
	.word	0x24c
	.byte	0xa
	.long	0x506e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x26
	.ascii "delete_expired\0"
	.byte	0x2
	.word	0x20c
	.byte	0xd
	.quad	.LFB4302
	.quad	.LFE4302-.LFB4302
	.uleb128 0x1
	.byte	0x9c
	.long	0x5363
	.uleb128 0x27
	.ascii "cutoff_date\0"
	.byte	0x2
	.word	0x212
	.byte	0x11
	.long	0x509c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x27
	.ascii "total\0"
	.byte	0x2
	.word	0x213
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x27
	.ascii "all\0"
	.byte	0x2
	.word	0x214
	.byte	0xe
	.long	0x50e6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x27
	.ascii "to_delete\0"
	.byte	0x2
	.word	0x21b
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x27
	.ascii "confirm\0"
	.byte	0x2
	.word	0x22a
	.byte	0xa
	.long	0x20b3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x29
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x52d4
	.uleb128 0x27
	.ascii "i\0"
	.byte	0x2
	.word	0x21c
	.byte	0xe
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x29
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.long	0x52f8
	.uleb128 0x27
	.ascii "i\0"
	.byte	0x2
	.word	0x224
	.byte	0x12
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x29
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.long	0x5342
	.uleb128 0x27
	.ascii "deleted\0"
	.byte	0x2
	.word	0x22e
	.byte	0xd
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2a
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x27
	.ascii "i\0"
	.byte	0x2
	.word	0x22f
	.byte	0x12
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x2a
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.uleb128 0x27
	.ascii "i\0"
	.byte	0x2
	.word	0x239
	.byte	0x12
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x26
	.ascii "filter_and_sort\0"
	.byte	0x2
	.word	0x19d
	.byte	0xd
	.quad	.LFB4301
	.quad	.LFE4301-.LFB4301
	.uleb128 0x1
	.byte	0x9c
	.long	0x55d9
	.uleb128 0x27
	.ascii "criteria\0"
	.byte	0x2
	.word	0x1a3
	.byte	0x14
	.long	0x4f6b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x27
	.ascii "ok\0"
	.byte	0x2
	.word	0x1a4
	.byte	0xa
	.long	0x506e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -321
	.uleb128 0x27
	.ascii "count\0"
	.byte	0x2
	.word	0x1b8
	.byte	0x9
	.long	0xe9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0x27
	.ascii "results\0"
	.byte	0x2
	.word	0x1b9
	.byte	0xe
	.long	0x50e6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x27
	.ascii "default_keys\0"
	.byte	0x2
	.word	0x1c0
	.byte	0x11
	.long	0x55d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x27
	.ascii "default_orders\0"
	.byte	0x2
	.word	0x1c1
	.byte	0xa
	.long	0x55e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -354
	.uleb128 0x27
	.ascii "sort_keys\0"
	.byte	0x2
	.word	0x1c2
	.byte	0x11
	.long	0x51c6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -384
	.uleb128 0x27
	.ascii "sort_orders\0"
	.byte	0x2
	.word	0x1c3
	.byte	0xa
	.long	0x55f9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -387
	.uleb128 0x27
	.ascii "sort_count\0"
	.byte	0x2
	.word	0x1c4
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x27
	.ascii "answer\0"
	.byte	0x2
	.word	0x1c6
	.byte	0xa
	.long	0x20b3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -395
	.uleb128 0x27
	.ascii "show\0"
	.byte	0x2
	.word	0x1e7
	.byte	0x9
	.long	0xe9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x28
	.secrel32	.LASF7
	.byte	0x2
	.word	0x1f0
	.byte	0xa
	.long	0x5609
	.uleb128 0x3
	.byte	0x91
	.sleb128 -405
	.uleb128 0x29
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x54ee
	.uleb128 0x27
	.ascii "i\0"
	.byte	0x2
	.word	0x1c9
	.byte	0x12
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2b
	.secrel32	.Ldebug_ranges0+0
	.uleb128 0x27
	.ascii "key\0"
	.byte	0x2
	.word	0x1ca
	.byte	0x12
	.long	0x5619
	.uleb128 0x3
	.byte	0x91
	.sleb128 -704
	.uleb128 0x28
	.secrel32	.LASF8
	.byte	0x2
	.word	0x1cb
	.byte	0x12
	.long	0x5156
	.uleb128 0x3
	.byte	0x91
	.sleb128 -672
	.uleb128 0x27
	.ascii "order\0"
	.byte	0x2
	.word	0x1d4
	.byte	0x12
	.long	0x20b3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -413
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x5533
	.uleb128 0x27
	.ascii "i\0"
	.byte	0x2
	.word	0x1e8
	.byte	0xe
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2a
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x27
	.ascii "r\0"
	.byte	0x2
	.word	0x1e9
	.byte	0x11
	.long	0x50c6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x5576
	.uleb128 0x27
	.ascii "fname\0"
	.byte	0x2
	.word	0x1f5
	.byte	0xe
	.long	0x5156
	.uleb128 0x3
	.byte	0x91
	.sleb128 -672
	.uleb128 0x2c
	.quad	.LVL17
	.long	0x5c8f
	.uleb128 0x2c
	.quad	.LVL18
	.long	0x5c8f
	.byte	0
	.uleb128 0x29
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x559a
	.uleb128 0x27
	.ascii "i\0"
	.byte	0x2
	.word	0x203
	.byte	0xe
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x29
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x55be
	.uleb128 0x27
	.ascii "i\0"
	.byte	0x2
	.word	0x208
	.byte	0xe
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x2c
	.quad	.LVL15
	.long	0x5c8f
	.uleb128 0x2c
	.quad	.LVL16
	.long	0x5c8f
	.byte	0
	.uleb128 0x10
	.long	0x509c
	.long	0x55e9
	.uleb128 0x11
	.long	0x93
	.byte	0x1
	.byte	0
	.uleb128 0x10
	.long	0x506e
	.long	0x55f9
	.uleb128 0x11
	.long	0x93
	.byte	0x1
	.byte	0
	.uleb128 0x10
	.long	0x506e
	.long	0x5609
	.uleb128 0x11
	.long	0x93
	.byte	0x2
	.byte	0
	.uleb128 0x10
	.long	0x77
	.long	0x5619
	.uleb128 0x11
	.long	0x93
	.byte	0x9
	.byte	0
	.uleb128 0x10
	.long	0x77
	.long	0x5629
	.uleb128 0x11
	.long	0x93
	.byte	0x1f
	.byte	0
	.uleb128 0x2d
	.ascii "validate_sort_key\0"
	.byte	0x2
	.word	0x193
	.byte	0xd
	.long	0x506e
	.quad	.LFB4300
	.quad	.LFE4300-.LFB4300
	.uleb128 0x1
	.byte	0x9c
	.long	0x56a3
	.uleb128 0x2e
	.ascii "key\0"
	.byte	0x2
	.word	0x193
	.byte	0x2b
	.long	0x509c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x27
	.ascii "valid_keys\0"
	.byte	0x2
	.word	0x194
	.byte	0x11
	.long	0x56a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2a
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x27
	.ascii "i\0"
	.byte	0x2
	.word	0x195
	.byte	0xe
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	0x509c
	.long	0x56b3
	.uleb128 0x11
	.long	0x93
	.byte	0x7
	.byte	0
	.uleb128 0x26
	.ascii "find_record\0"
	.byte	0x2
	.word	0x175
	.byte	0xd
	.quad	.LFB4299
	.quad	.LFE4299-.LFB4299
	.uleb128 0x1
	.byte	0x9c
	.long	0x570b
	.uleb128 0x27
	.ascii "sid\0"
	.byte	0x2
	.word	0x17b
	.byte	0xa
	.long	0x4ebd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x27
	.ascii "cid\0"
	.byte	0x2
	.word	0x17c
	.byte	0xa
	.long	0x4ebd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x27
	.ascii "rec\0"
	.byte	0x2
	.word	0x180
	.byte	0xd
	.long	0x50c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x26
	.ascii "delete_record\0"
	.byte	0x2
	.word	0x163
	.byte	0xd
	.quad	.LFB4298
	.quad	.LFE4298-.LFB4298
	.uleb128 0x1
	.byte	0x9c
	.long	0x5755
	.uleb128 0x27
	.ascii "sid\0"
	.byte	0x2
	.word	0x169
	.byte	0xa
	.long	0x4ebd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x27
	.ascii "cid\0"
	.byte	0x2
	.word	0x16a
	.byte	0xa
	.long	0x4ebd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x26
	.ascii "insert_record\0"
	.byte	0x2
	.word	0x141
	.byte	0xd
	.quad	.LFB4297
	.quad	.LFE4297-.LFB4297
	.uleb128 0x1
	.byte	0x9c
	.long	0x57a0
	.uleb128 0x27
	.ascii "rec\0"
	.byte	0x2
	.word	0x147
	.byte	0xc
	.long	0x4edd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x27
	.ascii "ok\0"
	.byte	0x2
	.word	0x148
	.byte	0xa
	.long	0x506e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -289
	.byte	0
	.uleb128 0x26
	.ascii "save_data\0"
	.byte	0x2
	.word	0x133
	.byte	0xd
	.quad	.LFB4296
	.quad	.LFE4296-.LFB4296
	.uleb128 0x1
	.byte	0x9c
	.long	0x57d8
	.uleb128 0x27
	.ascii "saved\0"
	.byte	0x2
	.word	0x139
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x26
	.ascii "load_data\0"
	.byte	0x2
	.word	0x114
	.byte	0xd
	.quad	.LFB4295
	.quad	.LFE4295-.LFB4295
	.uleb128 0x1
	.byte	0x9c
	.long	0x5824
	.uleb128 0x27
	.ascii "input\0"
	.byte	0x2
	.word	0x11a
	.byte	0xa
	.long	0x5156
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x27
	.ascii "loaded\0"
	.byte	0x2
	.word	0x12b
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2f
	.ascii "select_data_structure\0"
	.byte	0x2
	.byte	0xed
	.byte	0xd
	.quad	.LFB4294
	.quad	.LFE4294-.LFB4294
	.uleb128 0x1
	.byte	0x9c
	.long	0x5872
	.uleb128 0x30
	.secrel32	.LASF7
	.byte	0x2
	.byte	0xee
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x25
	.ascii "ok\0"
	.byte	0x2
	.byte	0xf3
	.byte	0xa
	.long	0x506e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x2f
	.ascii "generate_data_menu\0"
	.byte	0x2
	.byte	0xbb
	.byte	0xd
	.quad	.LFB4293
	.quad	.LFE4293-.LFB4293
	.uleb128 0x1
	.byte	0x9c
	.long	0x5916
	.uleb128 0x25
	.ascii "ok\0"
	.byte	0x2
	.byte	0xc2
	.byte	0xa
	.long	0x506e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x30
	.secrel32	.LASF7
	.byte	0x2
	.byte	0xc3
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x25
	.ascii "count\0"
	.byte	0x2
	.byte	0xc9
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x25
	.ascii "path\0"
	.byte	0x2
	.byte	0xca
	.byte	0x11
	.long	0x509c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x25
	.ascii "custom_path\0"
	.byte	0x2
	.byte	0xcb
	.byte	0xa
	.long	0x5156
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x31
	.ascii "generate_csv\0"
	.byte	0x2
	.byte	0xe5
	.byte	0x11
	.long	0x506e
	.uleb128 0x18
	.long	0xe9
	.uleb128 0x18
	.long	0x509c
	.byte	0
	.byte	0
	.uleb128 0x2f
	.ascii "display_main_menu\0"
	.byte	0x2
	.byte	0xa9
	.byte	0xd
	.quad	.LFB4292
	.quad	.LFE4292-.LFB4292
	.uleb128 0x1
	.byte	0x9c
	.long	0x5950
	.uleb128 0x2c
	.quad	.LVL7
	.long	0x5c8f
	.byte	0
	.uleb128 0x2f
	.ascii "read_string\0"
	.byte	0x2
	.byte	0x9a
	.byte	0xd
	.quad	.LFB4291
	.quad	.LFE4291-.LFB4291
	.uleb128 0x1
	.byte	0x9c
	.long	0x59c1
	.uleb128 0x32
	.secrel32	.LASF8
	.byte	0x2
	.byte	0x9a
	.byte	0x25
	.long	0x509c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x32
	.secrel32	.LASF9
	.byte	0x2
	.byte	0x9a
	.byte	0x33
	.long	0x3ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x33
	.ascii "size\0"
	.byte	0x2
	.byte	0x9a
	.byte	0x42
	.long	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x32
	.secrel32	.LASF10
	.byte	0x2
	.byte	0x9a
	.byte	0x54
	.long	0x509c
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x2c
	.quad	.LVL6
	.long	0x5c8f
	.byte	0
	.uleb128 0x34
	.ascii "read_float\0"
	.byte	0x2
	.byte	0x84
	.byte	0xe
	.long	0x79e
	.quad	.LFB4290
	.quad	.LFE4290-.LFB4290
	.uleb128 0x1
	.byte	0x9c
	.long	0x5a44
	.uleb128 0x32
	.secrel32	.LASF8
	.byte	0x2
	.byte	0x84
	.byte	0x25
	.long	0x509c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x32
	.secrel32	.LASF10
	.byte	0x2
	.byte	0x84
	.byte	0x33
	.long	0x79e
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x32
	.secrel32	.LASF11
	.byte	0x2
	.byte	0x84
	.byte	0x47
	.long	0x506e
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x33
	.ascii "ok\0"
	.byte	0x2
	.byte	0x84
	.byte	0x5a
	.long	0x5a44
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x25
	.ascii "line\0"
	.byte	0x2
	.byte	0x85
	.byte	0xa
	.long	0x4ecd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2c
	.quad	.LVL5
	.long	0x5c8f
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x506e
	.uleb128 0x34
	.ascii "read_int\0"
	.byte	0x2
	.byte	0x6e
	.byte	0xc
	.long	0xe9
	.quad	.LFB4289
	.quad	.LFE4289-.LFB4289
	.uleb128 0x1
	.byte	0x9c
	.long	0x5acb
	.uleb128 0x32
	.secrel32	.LASF8
	.byte	0x2
	.byte	0x6e
	.byte	0x21
	.long	0x509c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x32
	.secrel32	.LASF10
	.byte	0x2
	.byte	0x6e
	.byte	0x2d
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x32
	.secrel32	.LASF11
	.byte	0x2
	.byte	0x6e
	.byte	0x41
	.long	0x506e
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x33
	.ascii "ok\0"
	.byte	0x2
	.byte	0x6e
	.byte	0x54
	.long	0x5a44
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x25
	.ascii "line\0"
	.byte	0x2
	.byte	0x6f
	.byte	0xa
	.long	0x4ecd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2c
	.quad	.LVL4
	.long	0x5c8f
	.byte	0
	.uleb128 0x34
	.ascii "read_line\0"
	.byte	0x2
	.byte	0x62
	.byte	0xd
	.long	0x506e
	.quad	.LFB4288
	.quad	.LFE4288-.LFB4288
	.uleb128 0x1
	.byte	0x9c
	.long	0x5b20
	.uleb128 0x32
	.secrel32	.LASF9
	.byte	0x2
	.byte	0x62
	.byte	0x1d
	.long	0x3ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x33
	.ascii "size\0"
	.byte	0x2
	.byte	0x62
	.byte	0x2c
	.long	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2c
	.quad	.LVL3
	.long	0x5c8f
	.byte	0
	.uleb128 0x2f
	.ascii "trim_whitespace\0"
	.byte	0x2
	.byte	0x53
	.byte	0xd
	.quad	.LFB4287
	.quad	.LFE4287-.LFB4287
	.uleb128 0x1
	.byte	0x9c
	.long	0x5ba3
	.uleb128 0x32
	.secrel32	.LASF9
	.byte	0x2
	.byte	0x53
	.byte	0x23
	.long	0x3ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x25
	.ascii "start\0"
	.byte	0x2
	.byte	0x55
	.byte	0xb
	.long	0x3ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x25
	.ascii "end\0"
	.byte	0x2
	.byte	0x59
	.byte	0xb
	.long	0x3ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x25
	.ascii "len\0"
	.byte	0x2
	.byte	0x5d
	.byte	0xc
	.long	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2c
	.quad	.LVL1
	.long	0x5c9b
	.uleb128 0x2c
	.quad	.LVL2
	.long	0x5c9b
	.byte	0
	.uleb128 0x35
	.ascii "run_app\0"
	.byte	0x2
	.byte	0x26
	.byte	0x6
	.quad	.LFB4286
	.quad	.LFE4286-.LFB4286
	.uleb128 0x1
	.byte	0x9c
	.long	0x5bfd
	.uleb128 0x30
	.secrel32	.LASF7
	.byte	0x2
	.byte	0x27
	.byte	0x9
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2a
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x25
	.ascii "input_line\0"
	.byte	0x2
	.byte	0x30
	.byte	0xe
	.long	0x5619
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0x2d
	.ascii "snprintf\0"
	.byte	0x1
	.word	0x312
	.byte	0x5
	.long	0xe9
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x5c8f
	.uleb128 0x2e
	.ascii "__stream\0"
	.byte	0x1
	.word	0x312
	.byte	0x23
	.long	0x405
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2e
	.ascii "__n\0"
	.byte	0x1
	.word	0x312
	.byte	0x34
	.long	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2e
	.ascii "__format\0"
	.byte	0x1
	.word	0x312
	.byte	0x53
	.long	0x50a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x36
	.uleb128 0x27
	.ascii "__retval\0"
	.byte	0x1
	.word	0x314
	.byte	0x7
	.long	0xe9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x27
	.ascii "__local_argv\0"
	.byte	0x1
	.word	0x315
	.byte	0x15
	.long	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x37
	.secrel32	.LASF12
	.secrel32	.LASF12
	.byte	0x1
	.byte	0x52
	.byte	0x17
	.uleb128 0x38
	.ascii "isspace\0"
	.ascii "__builtin_isspace\0"
	.byte	0x21
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x2c
	.word	0x2
	.secrel32	.Ldebug_info0
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"dr"
.Ldebug_ranges0:
	.quad	.LBB5-.Ltext0
	.quad	.LBE5-.Ltext0
	.quad	.LBB6-.Ltext0
	.quad	.LBE6-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"dr"
.Ldebug_line0:
	.section	.debug_str,"dr"
.LASF1:
	.ascii "student_id\0"
.LASF3:
	.ascii "semester\0"
.LASF12:
	.ascii "__acrt_iob_func\0"
.LASF0:
	.ascii "refcount\0"
.LASF10:
	.ascii "default_value\0"
.LASF7:
	.ascii "choice\0"
.LASF11:
	.ascii "allow_empty\0"
.LASF5:
	.ascii "DataContainer\0"
.LASF8:
	.ascii "prompt\0"
.LASF4:
	.ascii "FilterCriteria\0"
.LASF6:
	.ascii "DataInterface\0"
.LASF2:
	.ascii "course_name\0"
.LASF9:
	.ascii "buffer\0"
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	__ms_vsnprintf;	.scl	2;	.type	32;	.endef
	.def	print_utf8_printf;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	strcspn;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	atof;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	generate_csv;	.scl	2;	.type	32;	.endef
	.def	get_list_interface;	.scl	2;	.type	32;	.endef
	.def	get_hash_interface;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	load_from_csv;	.scl	2;	.type	32;	.endef
	.def	save_to_csv;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	filter_records;	.scl	2;	.type	32;	.endef
	.def	strdup;	.scl	2;	.type	32;	.endef
	.def	multi_key_sort;	.scl	2;	.type	32;	.endef
	.def	export_to_csv;	.scl	2;	.type	32;	.endef
	.def	stat_course_enrollment;	.scl	2;	.type	32;	.endef
	.def	stat_student_credits;	.scl	2;	.type	32;	.endef
	.def	stat_college_distribution;	.scl	2;	.type	32;	.endef
	.def	stat_semester_trend;	.scl	2;	.type	32;	.endef
	.def	stat_score_distribution;	.scl	2;	.type	32;	.endef
	.def	run_performance_comparison;	.scl	2;	.type	32;	.endef
