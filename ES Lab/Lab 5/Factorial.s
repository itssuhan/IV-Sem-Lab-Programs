	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=NUM
	LDR R3,=RESULT
	LDR R1,[R0]
	MOV R2,#1
LOOP
	MUL R2,R2,R1
	SUB R1,#1 ; R1 decreases from the number given with an decremention of 1
	CMP R1,#1
	BNE LOOP
	STR R2,[R3]
STOP
	B STOP ; Be Here
NUM DCD 5
	AREA mydata,CODE,READWRITE
RESULT DCD 0
	END
	