	.data
msg:
	.asciz "I am programming an ARM in assembly code!\n"
	.align 2

	.text
	.global main
main:
	mov ip, sp
	stmfd sp!, {fp, ip, lr, pc}
	sub fp, ip, #4
	
	ldr r0, =msg
	bl printf
	
	mov r0, #0
	ldmfd sp!, {fp, sp, lr}
	bx lr
