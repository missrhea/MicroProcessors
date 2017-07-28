DATA SEGMENT
	ARR DB 03H,05H,09H,10H,0AH,02H
	MSG1 DB 10,13, "SUM OF NUMBERS ARE:$"
	SUM DB 00H
	AVG DB ?
DATA ENDS
CODE SEGMENT
ASSUME DS:DATA,CS:CODE
START:
		MOV AX,DATA
		MOV DS,AX
		MOV AX,0000H
		MOV CL,06H
		MOV BL,00H
		LEA SI,ARR
AGAIN:	ADD BL,[SI]
		MOV SUM,BL
		INC SI
		DEC CL
		JZ  PRINT
		JMP AGAIN
PRINT:	MOV AL,SUM
		MOV BL,06H
		DIV BL
		MOV AVG,AL
		
		LEA DX,MSG1
		MOV AH,09H
		INT 21H
		MOV BL,AVG
		AND BL,0F0H
		ROR BL,04H
		CMP BL,0AH
		JC LAB1
		ADD BL,07H
LAB1:	ADD BL,30H	
		MOV DL,BL
		MOV AH,02H
		INT 21H
		MOV BL,AVG
		AND BL,0FH
		CMP BL,0AH
		JC LAB2
		ADD BL,07H
LAB2:	ADD BL,30H
		MOV DL,BL
		MOV AH,02H
		INT 21H
		
		MOV AH,4CH
		INT 21H
		
CODE ENDS
END START