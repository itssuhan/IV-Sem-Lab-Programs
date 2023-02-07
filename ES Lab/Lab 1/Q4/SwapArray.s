	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =ARR;
	ADD R1, R0, #36
	MOV R2, #10;
	MOV R5, #1
	
LOOP1 
	STR R5, [R0], #4
	ADD R5, #1
	SUBS R2, #1
	BNE LOOP1
	MOV R2, #5
	LDR R0, =ARR

LOOP2
	LDR R4 , [R0]
	LDR R3, [R1]
	STR R4, [R1], #-4
	STR R3, [R0], #4
	SUBS R2, #1
	BNE LOOP2
STOP 
	B STOP
	AREA mydata, DATA, READWRITE
ARR DCD 0;
	END
