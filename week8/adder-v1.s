	.data
msg:
	.asciz "You have passed %d parameters\n"
	.align 2

	.text
	.global main
main:
	mov ip, sp
	stmfd sp!, {r0, r1, fp, ip, lr, pc}
	sub fp, ip, #4
	
	mov r1, r0
	ldr r0, =msg
	bl printf
	
	mov r0, #0
	ldmfd sp!, {r1, r2, fp, sp, lr}
	bx lr
