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
	LDR R0,=N1 ; Load address of SRC into R0
	LDR R2,[R0]
	LDR R0,=N2
	LDR R3,[R0]
	LDR R0,=SUM
	;ADD RO, #7
	LDR R11, =PKBCD
	ADD R11, #8
	MOV R6, #0
	MOV R5, #0
UP
	MOV R7, R2
	MOV R8, R3
	AND R7,#0X0F ; Mask higher nibbles except last 4 bits of N1
	AND R8, #0X0F ; Mask higher nibbles except last 4 bits of N1
	ADD R7, R6 ; Add carry with N1
	MOV R6, #0 ; carry clear for the next round
	BL ADDN ; Branch to ADDN
	
	LSR R2, #4 ; Right shift the Number
	LSR R3,#4 ; Right Shift the Number
	CMP R2,#0 ; Check Whether the Number is Zero
	BNE UP
	;STRB R6,[R0]
	MOV R10,#8
PKIN
	LDRB R4,[R0,#-1]! ; Fetch the Byte
	ORR R5,R4 ; ORR/ADD
	SUBS R10,#1 ;Decrement counter from 8 onwards
	BEQ HALT ; If all fetched then HALT
	LSL R5,R5,#4 ; Left Shift the ORRed Number by 4
	B PKIN
HALT 
	STR R5,[R11] ; Store the Result
	
STOP
	B STOP ; Be There
	
ADDN
	ADD R7,R8 ; Add N1+N2
	CMP R7,#10 ; Check whether sum > 10?
	BLO STORE ; If no store result
	SUB R7,#10 ; Else Subtract 10
	ADD R6,#01 ; Simultaneously Increment Carry
STORE
	STRB R7,[R0],#1

N1 DCD 01000101010
N2 DCD 01010010101
SUM DCD 0
	AREA mydata,DATA,READWRITE
PKBCD DCD 0
	END