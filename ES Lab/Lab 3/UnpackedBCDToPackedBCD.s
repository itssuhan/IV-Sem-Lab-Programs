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
	LDR R0, =SRC  
	LDR R5, [R0]   
	MOV R2, #4  
	LDR R1, =0XF  
UP	
	AND R4, R5, R1  
	LSR R5, #4  
	LSL R1, #4  
	ORR R3, R4  
	SUBS R2, #1  
	BNE UP  
	LDR R0,=RES  
	STR R3,[R0]  
SRC DCD 0X01020304  
	AREA mydata, DATA, READWRITE  
RES DCD 0  
	END 
 