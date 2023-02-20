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
	LDR R0,=N1 			; Load the address of the first number
	LDR R1,[R0]			; Store the contents of the first number in R1
	LDR R0,=N2			; Load the address of the second number
	LDR R2,[R0]			; Store the contents of the second number in R2
	MOV R3,#0			; Counter for the loop (Quotient)
	LDR R6,=DST
UP	SUB R1,R1,R2		; 
	ADD R3,#1
	CMP R1,R2
	BGE UP
	STR R3,[R6],#4
	STR R1,[R6]
STOP	
	B STOP
N1 DCD 10
N2 DCD 5
	AREA mydata,DATA,READWRITE
DST DCD 0
	END