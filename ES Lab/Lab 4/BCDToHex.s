	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
ENTRY
	EXPORT Reset_Handler
Reset_Handler
	ldr r0, =N1
	ldr r1, =dst
	ldr r2, [r0]
	mov r3, #1
	mov r4, #0xa
	mov r5, #0
	mov r7, #0xf
up 
	mov r6, r2
	and r6, r7
	mla r5, r6, r3, r5
	mul r3, r4
	lsr r2, #4
	cmp r2, #0
	bne up
	str r5, [r1]
stop
	b stop
N1 DCD 00110000
dst DCD 0
	AREA mydata,DATA,READWRITE
	END