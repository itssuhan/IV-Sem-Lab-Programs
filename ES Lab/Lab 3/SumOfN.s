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
	LDR R0,=SRC ; Store SRC and DST in R0 and R1
	LDR R1,=DST
	MOV R2, #0	; Initialise R2 with value 0
	LDR R3,[R0]	; Get the value of R0 and store in R3
	MLA R2,R3,R3,R3 ; Operation Involved R3xR3+R3=R2
	LSR R2,#1 
	STR R2,[R1] ; Left Shift R2 and store in R1
STOP	
	B STOP
SRC	DCD 5
	AREA mydata,DATA,READWRITE
DST DCD 0
	END