DATA SEGMENT
	NUM DW ?
	MSG1 DB 10,13, "ENTER NUMBER:$"
	MSG2 DB 10,13, "FACTORIAL:$"
	FACT1 DW 0001H
	TMP DW ?
DATA ENDS
CODE SEGMENT
ASSUME DS:DATA, CS:CODE
START:
		MOV AX,DATA
		MOV DS,AX
		MOV AX,0000H
		LEA DX,MSG1
		MOV AH,9
		INT 21H
		MOV AH,1
		INT 21H
		CMP AL,41H
		JC LAB1
		SUB AL,07H
LAB1:	SUB AL,30H
		MOV AH,00H
		MOV NUM,AX
		MOV BX,NUM
		MOV AX,0001H
		MOV DX,0000H
AGAIN:	MUL BX
		DEC BX
		JZ PRINT
		JMP AGAIN
PRINT:	MOV FACT1,AX
		LEA DX,MSG2
		MOV AH,9
		INT 21H
		MOV DX,FACT1
		CALL OUTPUT
		MOV AH,4CH
		INT 21H
		
		
		OUTPUT PROC	
			MOV TMP,DX
			MOV DX,TMP
			AND DX,0F000H
			ROR DX,0CH
			CMP DX,000AH
			JC LABA
			ADD DX,0007H
LABA:		ADD DX,0030H
			MOV AH,02H
			INT 21H
			MOV DX,TMP
			AND DX,0F00H
			ROR DX,08H
			CMP DX,000AH
			JC LABB
			ADD DX,0007H
LABB:		ADD DX,0030H
			MOV AH,02H
			INT 21H
			MOV DX,TMP
			AND DX,00F0H
			ROR DX,04H
			CMP DX,000AH
			JC LABC
			ADD DX,0007H
LABC:		ADD DX,0030H
			MOV AH,02H
			INT 21H
			MOV DX,TMP
			AND DX,000FH
			CMP DX,000AH
			JC LABD
			ADD DX,0007H
LABD:		ADD DX,0030H
			MOV AH,02H
			INT 21H
			RET
		ENDP 	
		
CODE ENDS
END START
		