	.arch armv5t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"ffib3.c"
	.text
	.align	2
	.global	fib
	.type	fib, %function
fib:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bgt	.L2
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	b	.L3
.L2:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	mov	r0, r3
	bl	fib
	mov	r4, r0
	ldr	r3, [fp, #-24]
	sub	r3, r3, #2
	mov	r0, r3
	bl	fib
	mov	r3, r0
	add	r4, r4, r3
	str	r4, [fp, #-28]
.L3:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
	.size	fib, .-fib
	.ident	"GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
	.section	.note.GNU-stack,"",%progbits
