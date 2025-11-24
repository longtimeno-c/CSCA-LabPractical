	.data
msg:
	.asciz "%d + %d = %d\n"
	.align 2

	.text
	.global main
main:
	mov ip, sp
	stmfd sp!, {fp, ip, lr, pc}
	sub fp, ip, #4
	
	ldr r0, =msg
	mov r1, #2
	mov r2, #3
	add r3, r1, r2
	bl printf
	
	mov r0, #0
	ldmfd sp!, {fp, sp, lr}
	bx lr
