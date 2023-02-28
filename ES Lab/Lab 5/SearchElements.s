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
	LDR R0,=Input ; Holding Input Array's Input Address
	LDR R1,=Position ; Position is Stored
	MOV R3,#10 ; counter for L1 loop (Contains number of elements in the array)
	MOV R4,#8 ; Element to be Searched
	MOV R6,#1 ; 
	MOV R7,#0 ; Counter which has position of Array
L1 
	LDR R5,[R0],#4
	ADD R7,#1
	CMP R4,R5 ; Compare the element to be searched with each element of Array
	BEQ Label1
	SUB R3,#1
	BNE L1
	B HERE
Label1
	STR R6,[R1],#4 ; Stores if the element is present in the array
	STR R7,[R1] ; Stores the position of the element 
HERE
	B HERE ; Stay Here
Input DCD 1,2,3,4,5,6,7,8,9,10
	AREA mydata,DATA,READWRITE
Position DCD 0
	END
	
	
	
	