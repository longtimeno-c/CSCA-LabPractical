	.data
msg:
	.asciz "%d parameters. 1st arg: %s, 2nd arg: %s\n"
usage:
	.asciz "Usage: %s n m (with n and m integers)\n"
	.align 2

	.text
	.global main
main:
	mov ip, sp
	stmfd sp!, {r0, r1, fp, ip, lr, pc}
	sub fp, ip, #4
	
	cmp r0, #3
	beq CONT
	
	@ Print usage message
	ldr r1, [r1]
	ldr r0, =usage
	bl printf
	mov r0, #1
	ldmfd sp!, {r1, r2, fp, sp, lr}
	bx lr
	
CONT:
	ldr r3, [r1, #8]
	ldr r2, [r1, #4]
	mov r1, r0
	ldr r0, =msg
	bl printf
	
	mov r0, #0
	ldmfd sp!, {r1, r2, fp, sp, lr}
	bx lr
