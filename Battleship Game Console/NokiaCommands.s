PIN_RESET   EQU 0x40004200		
SSI0_DR_R   EQU 0x40008008	
SSI0_SR_R   EQU 0x4000800C
DC          EQU 0x40004100

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			EXPORT  	NokiaCommands	; Make available
			EXPORT  	NokiaClear
			EXPORT		SetCursor_X
			EXPORT		SetCursor_Y
			EXPORT		PrintCursor
			EXPORT   	PrintMap
			EXPORT		ClearMap
			EXPORT		WAITCOMMAND
			EXPORT		WAITDATA
			EXTERN 		DELAY100	
			EXPORT		PrintCursorShip
			EXPORT		PrintShip				
			EXPORT		PrintShip2
			EXPORT		PrintShip3
			EXPORT		PrintShip4
			EXPORT		PrintWarShip				
			EXPORT		PrintWarShip2
			EXPORT		PrintWarShip3
			EXPORT		PrintWarShip4	
				EXPORT		PRINT
			EXPORT		PrintCursor2
			IMPORT	READ_POT1
			IMPORT	READ_POT2
			EXPORT	PrintMine1
			EXPORT	PrintMine2
			EXPORT	PrintMine3
				EXPORT	PrintMine4
NokiaCommands			PROC	
						
				
NokiaClear		PROC			;CLEAR ALL SCREEN
				PUSH {LR}
				PUSH {R0-R2}
				LDR R1, =DC				;data
				LDR R0, [R1]
				MOV R0, #0x40 ; 
				STR R0, [R1]							
				MOV R2, #518
		
loopClear		BL WAITDATA	
				MOV R5, #0x00	; SEND 0X00 518 TIMES
				BL PRINT
				SUBS R2,#1				
				BNE loopClear
				POP {R0-R2}
				POP{LR}
				ENDP
				BX	LR		
				LTORG


;;;;;;;;;;;;;;;ClearMap;;;;;;;;;;;;;;;;;;;	
ClearMap		PROC
				PUSH {LR}
				PUSH {R0-R5}
				LDR R1, =DC				;data
				LDR R0, [R1]
				MOV R0, #0x40 ; 
				STR R0, [R1]							
	;CLEAR LEFT LINE OF THE FIELD		
				MOV R4, #6
				BL SetCursor_X			
				MOV R4, #1
				BL SetCursor_Y
				BL DELAY100	
				MOV R5, 0xFF				
				BL PRINT
				BL DELAY100	
				MOV R4, #6
				BL SetCursor_X			
				MOV R4, #2
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				BL DELAY100	
				MOV R4, #6
				BL SetCursor_X		
				MOV R4, #3
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				BL DELAY100	
				MOV R4, #6
				BL SetCursor_X		
				MOV R4, #4
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				BL DELAY100	
				;CLEAR LEFT LINE OF THE FIELD	
			


				MOV R4, #5
				BL SetCursor_X		
				MOV R4, #1
				BL SetCursor_Y
				MOV R5, 0x00		
				BL PRINT
				BL DELAY100	
				MOV R4, #5
				BL SetCursor_X		
				MOV R4, #2
				BL SetCursor_Y
				MOV R5, 0x00		
				BL PRINT
				BL DELAY100	
				MOV R4, #5
				BL SetCursor_X		
				MOV R4, #3
				BL SetCursor_Y
				MOV R5, 0x00		
				BL PRINT
				BL DELAY100	
				MOV R4, #5
				BL SetCursor_X		
				MOV R4, #4
				BL SetCursor_Y
				MOV R5, 0x00				
				BL PRINT
				BL DELAY100	
	;CLEAR LEFT LINE OF THE FIELD					
				
				
				
				
				
				
			
			;CLEAR RIGHT LINE OF THE FIELD		
				MOV R4, #69
				BL SetCursor_X			
				MOV R4, #1
				BL SetCursor_Y
				BL DELAY100	
				MOV R5, 0xFF				
				BL PRINT
				BL DELAY100	
				MOV R4, #69
				BL SetCursor_X			
				MOV R4, #2
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				BL DELAY100	
				MOV R4, #69
				BL SetCursor_X		
				MOV R4, #3
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				BL DELAY100	
				MOV R4, #69
				BL SetCursor_X		
				MOV R4, #4
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				BL DELAY100	
				
				
				MOV R4, #70
				BL SetCursor_X		
				MOV R4, #1
				BL SetCursor_Y
				MOV R5, 0x00		
				BL PRINT
				BL DELAY100	
				MOV R4, #70
				BL SetCursor_X		
				MOV R4, #2
				BL SetCursor_Y
				MOV R5, 0x00		
				BL PRINT
				BL DELAY100	
				MOV R4, #70
				BL SetCursor_X		
				MOV R4, #3
				BL SetCursor_Y
				MOV R5, 0x00		
				BL PRINT
				BL DELAY100	
				MOV R4, #70
				BL SetCursor_X		
				MOV R4, #4
				BL SetCursor_Y
				MOV R5, 0x00				
				BL PRINT
				BL DELAY100	
				;CLEAR RIGHT LINE OF THE FIELD		
				
				
				
				
				
				
				
				
			
				MOV R2, #7				
		
loopClMap		BL WAITDATA	;CLEAR INSIDE THE MAP

				MOV R4, R2
				BL SetCursor_X		;CLEAR 7-68		
				MOV R4, #1
				BL SetCursor_Y
				MOV R5, 0x00				
				BL PRINT
				
				BL DELAY100	
				MOV R4, R2
				BL SetCursor_X
				MOV R4, #2
				BL SetCursor_Y	
				MOV R5, 0x00
				BL PRINT
			
				BL DELAY100	
				MOV R4, R2
				BL SetCursor_X
				MOV R4, #3
				BL SetCursor_Y	
				MOV R5, 0x00
				BL PRINT
				
				BL DELAY100	
				MOV R4, R2
				BL SetCursor_X
				MOV R4, #4
				BL SetCursor_Y	
				MOV R5, 0x00
				BL PRINT
				BL DELAY100	
				
				ADD R2,#1	
				CMP	R2,#69
				BNE loopClMap
				POP {R0-R5}
				POP{LR}
				ENDP
				BX	LR	
				LTORG
;;;;;;;;;;;;;;;ClearMap_End;;;;;;;;;;;;;;;;;;;	










WAITCOMMAND		PROC		;WAIT IF THE SSI IS BUSY
				PUSH {LR}
				PUSH {R0-R1}
wcommand		LDR R1, =SSI0_SR_R
				LDR R0, [R1]
				ANDS R0, #0x00000010 ;SSI Busy Bit
				BNE wcommand
				POP {R0-R1}
				POP{LR}
				
				ENDP
				BX	LR
		
WAITDATA		PROC ;WAIT SSI BEFORE SENDING DATA
				PUSH {LR}
				PUSH {R0-R1}				
wdata			LDR R1, =SSI0_SR_R		
				LDR R0, [R1]
				ANDS R0, #0x00000002 
				BEQ wdata					
				POP {R0-R1}
				POP{LR}
				ENDP
				BX	LR
				LTORG


SetCursor_X	PROC			;ADJUST SET CURSORX
	
				PUSH {LR}	
				PUSH {R0-R4}
				LDR R1, =DC			;command 
				LDR R0, [R1]
				MOV R0, #0 ; 
				STR R0, [R1]				
				BL WAITCOMMAND				
				LDR R1, =SSI0_DR_R				
				MOV R3,  0x80			
				ORR R0, R3,R4
				STR R0, [R1]						
				BL WAITCOMMAND				
				LDR R1, =DC				;data
				LDR R0, [R1]
				MOV R0, #0x40 ; 
				STR R0, [R1]
				POP {R0-R4}
				POP{LR}
				ENDP
				BX	LR
				LTORG


SetCursor_Y	PROC		;ADJUST SET CURSORX
	
				PUSH {LR}	
				PUSH {R0-R4}
				LDR R1, =DC			;command 
				LDR R0, [R1]
				MOV R0, #0 ; 
				STR R0, [R1]				
				BL WAITCOMMAND				
				LDR R1, =SSI0_DR_R				
				MOV R3,  0x40
				ORR R0, R3,R4
				STR R0, [R1]						
				BL WAITCOMMAND				
				LDR R1, =DC				;data
				LDR R0, [R1]
				MOV R0, #0x40 ; 
				STR R0, [R1]
				POP	{R0-R4}
				POP{LR}
				ENDP
				BX	LR
				LTORG

PrintCursor		PROC
				PUSH {LR}
			;	SUB  R5, R8, #3
				
				
		
			;	MOV R5, #0x00				
			;	BL	PRINT
			;	BL  DELAY100
			
				
			    MOV R5, #0x1C
				BL	PRINT
				BL  DELAY100
				MOV R5, #0x1E
				BL	PRINT
				BL  DELAY100
				MOV R5, #0x1F
				BL	PRINT
				BL  DELAY100
				MOV R5, #0x1E
				BL	PRINT
				BL  DELAY100
				MOV R5, #0x1C
				BL	PRINT
				BL  DELAY100
				
			;	MOV R5, #0x00
			;	BL	PRINT
			;	BL  DELAY100
				
				POP{LR}
				BX	LR
				ENDP
				




PRINT			PROC			;SEND DATA TO PRINT
				PUSH {LR}		
				PUSH {R0-R5}		
				LDR R1, =DC				;data
				LDR R0, [R1]
				MOV R0, #0x40 ; 
				STR R0, [R1]

				BL WAITDATA
				LDR R1, =SSI0_DR_R					
				STR R5, [R1]
				
			
			;	BL WAITDATA
			;	LDR R1, =SSI0_DR_R	
			;	LDR R4, [R1]
			;	ORR R5, R4		
			;	STR R5, [R1]
			
			
				BL WAITDATA			
			
				POP {R0-R5}
				POP{LR}
				 
				BX	LR	
				LTORG








      
PrintMap		PROC		;PRINTS THE MAP
	
				PUSH {LR}		
				PUSH {R0-R8}
;;;;;;;;;;;;;;;TOP side;;;;;;;;;;;;;;;;;;;			
				
				MOV R7, #5
				MOV R6, #64				
loopTopSide		ADD	R7,R7,#1
				MOV	R4,R7
				BL SetCursor_X
				
				MOV R4, #0 
				BL SetCursor_Y	
				BL DELAY100	
				MOV R5, 0x80
				BL PRINT
				
				BL DELAY100	
				SUBS R6, #1
				BNE loopTopSide

;;;;;;;;;;;;;;;TOP side-end;;;;;;;;;;;;;;;;;;;	

;;;;;;;;;;;;;;;BOTTOM side;;;;;;;;;;;;;;;;;;;			
				
				MOV R7, #5
				MOV R6, #64				
loopBotSide		ADD	R7,R7,#1
				MOV	R4,R7
				BL SetCursor_X
				
				MOV R4, #5 
				BL SetCursor_Y	
				BL DELAY100	
				MOV R5, 0x01
				BL PRINT
				
				BL DELAY100	
				SUBS R6, #1
				BNE loopBotSide

;;;;;;;;;;;;;;;BOTTOM side-end;;;;;;;;;;;;;;;;;;;	

;;;;;;;;;;;;;;;left side;;;;;;;;;;;;;;;;;;;						
				MOV R4, #6
				BL SetCursor_X				
				MOV R4, #1
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				
				BL DELAY100	
				MOV R4, #6
				BL SetCursor_X
				MOV R4, #2
				BL SetCursor_Y	
				MOV R5, 0xFF
				BL PRINT
			
			BL DELAY100	
			MOV R4, #6
			BL SetCursor_X
			MOV R4, #3
			BL SetCursor_Y	
			MOV R5, 0xFF
			BL PRINT
			
			BL DELAY100	
			MOV R4, #6
			BL SetCursor_X
			MOV R4, #4
			BL SetCursor_Y	
			MOV R5, 0xFF
			BL PRINT
			BL DELAY100	
;;;;;;;;;;;;;;;left side-end;;;;;;;;;;;;;;;;;;;	
				
				
				
				
;;;;;;;;;;;;;;;right side;;;;;;;;;;;;;;;;;;;						
				MOV R4, #69
				BL SetCursor_X				
				MOV R4, #1
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				
				BL DELAY100	
				MOV R4, #69
				BL SetCursor_X
				MOV R4, #2
				BL SetCursor_Y	
				MOV R5, 0xFF
				BL PRINT
			
				BL DELAY100	
				MOV R4, #69
				BL SetCursor_X
				MOV R4, #3
				BL SetCursor_Y	
				MOV R5, 0xFF
				BL PRINT
				
				BL DELAY100	
				MOV R4, #69
				BL SetCursor_X
				MOV R4, #4
				BL SetCursor_Y	
				MOV R5, 0xFF
				BL PRINT
				BL DELAY100	
;;;;;;;;;;;;;;;left side-end;;;;;;;;;;;;;;;;;;;			
				
								
				POP {R0-R8}
				POP{LR}
				ENDP
				BX	LR
				
				
				
SHIP1X	EQU 0x20000400	
SHIP1Y	EQU 0x20000404
SHIP2X	EQU 0x20000408	
SHIP2Y	EQU 0x2000040C
SHIP3X	EQU 0x20000410	
SHIP3Y	EQU 0x20000414
SHIP4X	EQU 0x20000418	
SHIP4Y	EQU 0x2000041C
	
PrintShip		PROC		;PRINTS THE FIRST CIVILIAN SHIP
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =SHIP1X	
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
				
				LDR R8, =SHIP1Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1368
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1368
				SUBHI R8, #1368
				CMP R8, #1368
				SUBHI R8, #1368				
				
				MOV R9, #169
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10,  #0x81	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =SHIP1X					
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10, #0x81	
				MOV R11, #0xFF	
				RSB R12, #8
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
				LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				LTORG
;PRINTS THE SECOND CIVILIAN SHIP
PrintShip2		PROC
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =SHIP2X	
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
				
				LDR R8, =SHIP2Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1368
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1368
				SUBHI R8, #1368
				CMP R8, #1368
				SUBHI R8, #1368				
				
				MOV R9, #169
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10,  #0x81	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =SHIP2X					
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10, #0x81	
				MOV R11, #0xFF	
				RSB R12, #8
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
				LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR



PrintShip3		PROC			;PRINTS THE THIRD CIVILIAN SHIP
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =SHIP3X	
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
				
				LDR R8, =SHIP3Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1368
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1368
				SUBHI R8, #1368
				CMP R8, #1368
				SUBHI R8, #1368				
				
				MOV R9, #169
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10,  #0x81	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =SHIP3X					
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75  ;((4082-19)/55)
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10, #0x81	
				MOV R11, #0xFF	
				RSB R12, #8
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
				LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				LTORG




PrintShip4		PROC		;PRINTS THE FOURTH CIVILIAN SHIP
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =SHIP4X	
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
				
				LDR R8, =SHIP4Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1368
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1368
				SUBHI R8, #1368
				CMP R8, #1368
				SUBHI R8, #1368				
				
				MOV R9, #169
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10,  #0x81	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =SHIP4X					
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10, #0x81	
				MOV R11, #0xFF	
				RSB R12, #8
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
				LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				LTORG


SHIPWAR1X	EQU 0x20000420	
SHIPWAR1Y	EQU 0x20000424
SHIPWAR2X	EQU 0x20000428	
SHIPWAR2Y	EQU 0x2000042C
SHIPWAR3X	EQU 0x20000430	
SHIPWAR3Y	EQU 0x20000434
SHIPWAR4X	EQU 0x20000438	
SHIPWAR4Y	EQU 0x2000043C
	
;PrintWarShip		PROC
;	
;				PUSH {LR}		
;				PUSH {R0-R12}
;				
;				LDR R8, =SHIPWAR1X	
;				LDR R8, [R8]
;				MOV R4, #7	;starts at 10th column(left limit)	
;				MOV	R9,#75
;				UDIV R9, R8,R9				
;				ADD R4, R9
;				BL SetCursor_X
;				
;				LDR R8, =SHIPWAR1Y	
;				LDR R8, [R8]
;				MOV R4, #1	 ;starts at 1st row(upper limit)
;				MOV	R9,#1368
;				UDIV R9, R8,R9				
;				ADD R4, R9
;				BL SetCursor_Y	
;
;				
;				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
;				CMP R8, #1368
;				SUBHI R8, #1368
;				CMP R8, #1368
;				SUBHI R8, #1368				
;				
;				MOV R9, #169
;				UDIV R12, R8, R9
;				
;				
;				MOV R0,  #0x1C				
;				MOV R2,  #0x1E	
;				MOV R3,  #0xFF	
;				MOV R10,  #0xFF
;				MOV R11,  #0xFF	
;				;;;;;;;;;line1;;;;;;;;;;;;;;
;				MOV R3, #0x20
;				LSL R5, R3, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0x60
;				LSL R5, R10, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0xff
;				LSL R5, R10, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0xef
;				LSL R5, R10,  R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0xef
;				LSL R5, R10, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0xef
;				LSL R5, R10,  R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0x6f
;				LSL R5, R10, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R11, #0x2f
;				LSL R5, R11,  R12	
;				BL	PRINT
;				BL  DELAY100
;				ADD R4, #1
;				BL SetCursor_Y	
;				
;				;;;;;;;Finding row (x axis);;;;;;
;				LDR R8, =SHIPWAR1X					
;				LDR R8, [R8]
;				MOV R4, #7	;starts at 10th column(left limit)	
;				MOV	R9,#75
;				UDIV R9, R8,R9				
;				ADD R4, R9
;				BL SetCursor_X
;		
;				MOV R0,  #0x1C				
;				MOV R2,  #0x1E	
;				MOV R3,  #0xFF	
;				MOV R10, #0xFF	
;				MOV R11, #0xFF	
;				RSB R12, #8
;				
;		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
;				MOV R3, #0x04
;				LSR R5, R3, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0x1C
;				LSR R5, R10, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0x17
;				LSR R5, R10, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0x15
;				LSR R5, R10,  R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0x15
;				LSR R5, R10, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0x15
;				LSR R5, R10,  R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R10, #0x1D
;				LSR R5, R10, R12	
;				BL	PRINT
;				BL  DELAY100
;				MOV R11, #0x05
;				LSR R5, R11,  R12	
;				BL	PRINT
;				BL  DELAY100
;				
;				POP {R0-R12}
;				POP{LR}
;				ENDP
;				BX	LR
PrintWarShip		PROC		;PRINTS THE FIRST WAR SHIP
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =SHIPWAR1X	
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
				
				LDR R8, =SHIPWAR1Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1368
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1368
				SUBHI R8, #1368
				CMP R8, #1368
				SUBHI R8, #1368				
				
				MOV R9, #169
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10,  #0xFF
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =SHIPWAR1X					
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10, #0xFF	
				MOV R11, #0xFF	
				RSB R12, #8
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
				LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR

PrintWarShip2		PROC		;PRINTS THE SECOND WAR SHIP
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =SHIPWAR2X	
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
				
				LDR R8, =SHIPWAR2Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1368
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1368
				SUBHI R8, #1368
				CMP R8, #1368
				SUBHI R8, #1368				
				
				MOV R9, #169
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10,  #0xFF	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =SHIPWAR2X					
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10, #0xFF	
				MOV R11, #0xFF	
				RSB R12, #8
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
				LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR



PrintWarShip3		PROC	;PRINTS THE THIRD WAR SHIP
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =SHIPWAR3X	
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
				
				LDR R8, =SHIPWAR3Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1368
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1368
				SUBHI R8, #1368
				CMP R8, #1368
				SUBHI R8, #1368				
				
				MOV R9, #169
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10,  #0xFF	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =SHIPWAR3X					
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10, #0xFF	
				MOV R11, #0xFF	
				RSB R12, #8
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
				LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR





PrintWarShip4		PROC	;PRINTS THE FOURTH WAR SHIP
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =SHIPWAR4X	
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
				
				LDR R8, =SHIPWAR4Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1368
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1368
				SUBHI R8, #1368
				CMP R8, #1368
				SUBHI R8, #1368				
				
				MOV R9, #169
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10,  #0xFF	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =SHIPWAR4X					
				LDR R8, [R8]
				MOV R4, #7	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R10, #0xFF
				MOV R11, #0xFF	
				RSB R12, #8
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
				LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR

MINE1X	EQU 0x20000450	
MINE1Y	EQU 0x20000454
MINE2X	EQU 0x20000458	
MINE2Y	EQU 0x2000045C
MINE3X	EQU 0x20000460	
MINE3Y	EQU 0x20000464
MINE4X	EQU 0x20000468	
MINE4Y	EQU 0x2000046C	


	

PrintMine1		PROC		;PRINTS THE MINE1
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =MINE1X	
				LDR R8, [R8]
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9				
				ADD R4, R9
				ADD R4, #2
				BL SetCursor_X
				
				LDR R8, =MINE1Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1054
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1056
				SUBHI R8, #1054
				;LDR R0, =866
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				
				MOV R9, #132
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x01	
				MOV R10,  #0xFF	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100

				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =MINE1X					
				LDR R8, [R8]
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9				
				ADD R4, R9
				ADD R4, #2
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x01	
				MOV R10, #0xFF
				MOV R11, #0xFF	
				
				CMP R12,#4
				BLO EXITMine1
				BEQ Mine1CASE1
				CMP R12,#5
				BEQ Mine1CASE2
				CMP R12,#6
				BEQ Mine1CASE3
				CMP R12,#7
				BEQ Mine1CASE4
				
				
Mine1CASE1		MOV R0,  #0x01				
				MOV R2,  #0x01	
				MOV R3,  #0x01
				B Mine1LINE2
Mine1CASE2		MOV R0,  #0x02				
				MOV R2,  #0x02	
				MOV R3,  #0x02
				B Mine1LINE2
Mine1CASE3		MOV R0,  #0x04				
				MOV R2,  #0x04
				MOV R3,  #0x04
				B Mine1LINE2
Mine1CASE4		MOV R0,  #0x08				
				MOV R2,  #0x08	
				MOV R3,  #0x08
				B Mine1LINE2
				
				
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
Mine1LINE2			LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				
				
EXITMine1		POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR	





PrintMine2		PROC		;PRINTS THE MINE2
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =MINE2X	
				LDR R8, [R8]
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9				
				ADD R4, R9
				ADD R4, #2
				BL SetCursor_X
				
				LDR R8, =MINE2Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1054
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1056
				SUBHI R8, #1054
				;LDR R0, =866
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				
				MOV R9, #132
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x01	
				MOV R10,  #0xFF	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100

				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =MINE2X					
				LDR R8, [R8]
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9				
				ADD R4, R9
				ADD R4, #2
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x01	
				MOV R10, #0xFF
				MOV R11, #0xFF	
				
				CMP R12,#4
				BLO EXITMine2
				BEQ Mine2CASE1
				CMP R12,#5
				BEQ Mine2CASE2
				CMP R12,#6
				BEQ Mine2CASE3
				CMP R12,#7
				BEQ Mine2CASE4
				
				
Mine2CASE1		MOV R0,  #0x01				
				MOV R2,  #0x01	
				MOV R3,  #0x01
				B Mine1LINE2
Mine2CASE2		MOV R0,  #0x02				
				MOV R2,  #0x02	
				MOV R3,  #0x02
				B Mine2LINE2
Mine2CASE3		MOV R0,  #0x04				
				MOV R2,  #0x04
				MOV R3,  #0x04
				B Mine2LINE2
Mine2CASE4		MOV R0,  #0x08				
				MOV R2,  #0x08	
				MOV R3,  #0x08
				B Mine2LINE2
				
				
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
Mine2LINE2			LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				
				
EXITMine2		POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR





PrintMine3		PROC	;PRINTS THE MINE3
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =MINE3X	
				LDR R8, [R8]
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9				
				ADD R4, R9
				ADD R4, #2
				BL SetCursor_X
				
				LDR R8, =MINE3Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1054
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1056
				SUBHI R8, #1054
				;LDR R0, =866
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				
				MOV R9, #132
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x01	
				MOV R10,  #0xFF	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100

				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =MINE3X					
				LDR R8, [R8]
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9				
				ADD R4, R9
				ADD R4, #2
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x01	
				MOV R10, #0xFF
				MOV R11, #0xFF	
				
				CMP R12,#4
				BLO EXITMine3
				BEQ Mine3CASE1
				CMP R12,#5
				BEQ Mine3CASE2
				CMP R12,#6
				BEQ Mine3CASE3
				CMP R12,#7
				BEQ Mine3CASE4
				
				
Mine3CASE1		MOV R0,  #0x01				
				MOV R2,  #0x01	
				MOV R3,  #0x01
				B Mine3LINE2
Mine3CASE2		MOV R0,  #0x02				
				MOV R2,  #0x02	
				MOV R3,  #0x02
				B Mine3LINE2
Mine3CASE3		MOV R0,  #0x04				
				MOV R2,  #0x04
				MOV R3,  #0x04
				B Mine3LINE2
Mine3CASE4		MOV R0,  #0x08				
				MOV R2,  #0x08	
				MOV R3,  #0x08
				B Mine3LINE2
				
				
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
Mine3LINE2			LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				
				
EXITMine3		POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				

PrintMine4		PROC		;PRINTS THE MINE4
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				LDR R8, =MINE4X	
				LDR R8, [R8]
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9				
				ADD R4, R9
				ADD R4, #2
				BL SetCursor_X
				
				LDR R8, =MINE4Y	
				LDR R8, [R8]
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1054
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_Y	

				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1056
				SUBHI R8, #1054
				;LDR R0, =866
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				
				MOV R9, #132
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x01	
				MOV R10,  #0xFF	
				MOV R11,  #0xFF	
				;;;;;;;;;line1;;;;;;;;;;;;;;
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100

				ADD R4, #1
				BL SetCursor_Y	
				
				;;;;;;;Finding row (x axis);;;;;;
				LDR R8, =MINE4X					
				LDR R8, [R8]
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9				
				ADD R4, R9
				ADD R4, #2
				BL SetCursor_X
		
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x01	
				MOV R10, #0xFF
				MOV R11, #0xFF	
				
				CMP R12,#4
				BLO EXITMine1
				BEQ Mine4CASE1
				CMP R12,#5
				BEQ Mine4CASE2
				CMP R12,#6
				BEQ Mine4CASE3
				CMP R12,#7
				BEQ Mine4CASE4
				
				
Mine4CASE1		MOV R0,  #0x01				
				MOV R2,  #0x01	
				MOV R3,  #0x01
				B Mine4LINE2
Mine4CASE2		MOV R0,  #0x02				
				MOV R2,  #0x02	
				MOV R3,  #0x02
				B Mine4LINE2
Mine4CASE3		MOV R0,  #0x04				
				MOV R2,  #0x04
				MOV R3,  #0x04
				B Mine4LINE2
Mine4CASE4		MOV R0,  #0x08				
				MOV R2,  #0x08	
				MOV R3,  #0x08
				B Mine4LINE2
				
				
				
		;;;;;;;;;;;;;;;;;line2;;;;;;;;;;;;;;
Mine4LINE2			LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				
				
EXITMine4		POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR


PrintCursorShip		PROC		;PRINTS THE CURSOR IN ATTACK PHASE
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				;;;;;;;Finding row (x axis);;;;;;
				BL READ_POT2
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
				;MOV R4, #15
				;BL SetCursor_X
				
				;;;;;finding column(y axis);;;;;;;;;;;;;;
				BL READ_POT1	
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1368
				UDIV R9, R8,R9				
				ADD R4, R9
				
				BL SetCursor_Y	
				
				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
				CMP R8, #1368
				SUBHI R8, #1368
				CMP R8, #1368
				SUBHI R8, #1368
				
				MOV R9, #169
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R6,  #0x9F	
				MOV R7,  #0x9D	
				MOV R10,  #0x81	
				MOV R11,  #0xFF	
			;	MOV R12,  #3	
				
CURSOR11		LSL R5, R0, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R2, R12				
				BL	PRINT
				BL  DELAY100
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R6, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R7, R12	
				BL	PRINT
				BL  DELAY100
				
				LSL R5, R10,  R12	
				BL	PRINT
				
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				
				BL  DELAY100
				LSL R5, R10,  R12	
				BL	PRINT
			
				BL  DELAY100
				LSL R5, R10, R12	
				BL	PRINT
				
				BL  DELAY100
				LSL R5, R11,  R12	
				BL	PRINT
				BL  DELAY100
				
				
				
		
				ADD R4, #1
				BL SetCursor_Y	
				
				
				;;;;;;;Finding row (x axis);;;;;;
				BL READ_POT2
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#75
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		;		MOV R4, #15
		;		BL SetCursor_X	
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0xFF	
				MOV R6,  #0x9F	
				MOV R7,  #0x9D	
				MOV R10,  #0x81	
				MOV R11,  #0xFF	
				RSB R12, #8
				
CURSOR22			LSR R5, R0, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R2, R12				
				BL	PRINT
				BL  DELAY100
				LSR R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R6, R12	
				BL	PRINT
				BL  DELAY100
				LSR R5, R7, R12	
				BL	PRINT
				BL  DELAY100
				
				LSR R5, R10,  R12	
				BL	PRINT
				
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				
				BL  DELAY100
				LSR R5, R10,  R12	
				BL	PRINT
			
				BL  DELAY100
				LSR R5, R10, R12	
				BL	PRINT
				
				BL  DELAY100
				LSR R5, R11,  R12	
				BL	PRINT
				BL  DELAY100


				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR


PrintCursor2		PROC
	
				PUSH {LR}		
				PUSH {R0-R12}
				
				;;;;;;;Finding row (x axis);;;;;;
				BL READ_POT2
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9			;4055/64=63	
				ADD R4, R9
				BL SetCursor_X
				;MOV R4, #15
				;BL SetCursor_X
				
				;;;;;finding column(y axis);;;;;;;;;;;;;;
				BL READ_POT1	
				MOV R4, #1	 ;starts at 1st row(upper limit)
				MOV	R9,#1054
				UDIV R9, R8,R9				
				ADD R4, R9
				
				BL SetCursor_Y	
				
				
				;;;;;;finding shift amount at y axis;;;;;;;;;;;;;;;
			;	LDR R0, =866
				CMP R8, #1056
				SUBHI R8, #1054
				;LDR R0, =866
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				CMP R8, #1056
				SUBHI R8, #1054
				
				MOV R9, #132
				UDIV R12, R8, R9
				
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x1F	
				
			;	MOV R6,  #0x9F	
			;	MOV R7,  #0x9D	
			;	MOV R10,  #0x81	
			;	MOV R11,  #0xFF	
			;	MOV R12,  #3	
				
				
				
CURSOR111		BL  DELAY100
				LSL R5, R0, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R2, R12				
				BL	PRINT
				BL  DELAY100
				LSL R5, R3, R12	
				BL	PRINT
				BL  DELAY100
				LSL R5, R2, R12	
				BL	PRINT
				BL  DELAY100
				MOV R0,  #0x1C
				LSL R5, R0, R12	
				BL	PRINT
				BL  DELAY100
				
				ADD R4, #1
				BL SetCursor_Y	
				
				
				;;;;;;;Finding row (x axis);;;;;;
				BL READ_POT2
				MOV R4, #5	;starts at 10th column(left limit)	
				MOV	R9,#66
				UDIV R9, R8,R9				
				ADD R4, R9
				BL SetCursor_X
		;		MOV R4, #15
		;		BL SetCursor_X	
				
				MOV R0,  #0x1C				
				MOV R2,  #0x1E	
				MOV R3,  #0x1F	
				
				
				
				CMP R12,#4
				BLO EXIT
				BEQ CASE11
				CMP R12,#5
				BEQ CASE22
				CMP R12,#6
				BEQ CASE33
				CMP R12,#7
				BEQ CASE44
				
				
CASE11			MOV R0,  #0x01				
				MOV R2,  #0x01	
				MOV R3,  #0x01
				B CURSOR222
CASE22			MOV R0,  #0x03				
				MOV R2,  #0x03	
				MOV R3,  #0x03
				B CURSOR222
CASE33			MOV R0,  #0x07				
				MOV R2,  #0x07
				MOV R3,  #0x07
				B CURSOR222
CASE44			MOV R0,  #0x0E				
				MOV R2,  #0x0E	
				MOV R3,  #0x0F
				B CURSOR222

				
CURSOR222		
				MOV R5, R2
				BL	PRINT
				BL  DELAY100
				MOV R5, R3				
				BL	PRINT
				BL  DELAY100
				MOV R5, R3	
				BL	PRINT
				BL  DELAY100
				MOV R5, R3	
				BL	PRINT
				BL  DELAY100
				MOV R5, R2
				BL	PRINT
				BL  DELAY100
			

EXIT			POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR


			ALIGN
			END