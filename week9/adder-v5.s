	.data
msg:
	.asciz "%d + %d = %d\n"
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
	@ Save argv pointer
	stmfd sp!, {r1}
	
	@ Convert first argument
	ldr r0, [r1, #4]
	bl atoi
	mov r4, r0
	
	@ Restore argv pointer
	ldmfd sp!, {r1}
	
	@ Save argv pointer again
	stmfd sp!, {r1}
	
	@ Convert second argument
	ldr r0, [r1, #8]
	bl atoi
	mov r5, r0
	
	@ Restore argv pointer
	ldmfd sp!, {r1}
	
	@ Compute sum
	add r3, r4, r5
	mov r2, r5
	mov r1, r4
	ldr r0, =msg
	bl printf
	
	mov r0, #0
	ldmfd sp!, {r1, r2, fp, sp, lr}
	bx lr
