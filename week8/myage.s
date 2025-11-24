	.data
msg:
	.asciz "I am %d years old\n"
	.align 2

	.text
	.global main
main:
	mov ip, sp
	stmfd sp!, {fp, ip, lr, pc}
	sub fp, ip, #4
	
	ldr r0, =msg
	mov r1, #20
	bl printf
	
	mov r0, #0
	ldmfd sp!, {fp, sp, lr}
	bx lr
