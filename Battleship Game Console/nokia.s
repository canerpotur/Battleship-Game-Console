SSI0_DR_R   EQU	0x40008008
SSI0_SR_R   EQU 0x4000800C
DC          EQU 0x40004100
TIMER0_RIS			EQU 0x4003001C ; Timer Interrupt Status
TIMER0_ICR			EQU 0x40030024 ; Timer Interrupt Clear
SYSCTL_RCGCTIMER 	EQU 0x400FE604 ; GPTM Gate Control
	
				AREA    	main, READONLY, CODE
				THUMB
				EXPORT 		__main				
				EXTERN		INIT_NOKIA
				EXTERN		CONFIG_NOKIA
				EXTERN		NokiaCommands
				EXTERN		NokiaClear
				EXTERN		SetCursor_X
				EXTERN		SetCursor_Y
				EXTERN		PrintCursor
				EXTERN   	PrintMap
				EXTERN		ClearMap
				EXTERN		WAITCOMMAND
				EXTERN		WAITDATA
				EXTERN 		DELAY100	
				EXTERN		READ_POT1
				EXTERN		READ_POT2				
				EXTERN  	INIT_SYSTICK_TIMER	
				EXTERN  	INIT_COUNTER
				EXTERN	INIT_SWITCHES
					EXTERN	DELAY100m
PFdata 	EQU 0x400253FC 				; Port F Data address
	
;R6 ;keeps mine number which can be 1 2 3 4
;R9 ;keeps 1 (battle) or 0 (civil) for ship 1
;R10;keeps 1 (battle) or 0 (civil) for ship 2 
;R11;keeps 1 (battle) or 0 (civil) for ship 3 
;R12;keeps 1 (battle) or 0 (civil) for ship 4 

;shipwar1x ; keeps 1st ship x pot value
;shipwar1y ; keeps 1st ship y pot value

;shipwar2x ; keeps 2nd ship x pot value
;shipwar2y ; keeps 2nd ship y pot value

;shipwar3x ; keeps 3rd ship x pot value
;shipwar3y ; keeps 3rd ship y pot value

;shipwar4x ; keeps 4th ship x pot value
;shipwar4y ; keeps 4th ship y pot value

;ship1x ; keeps 1st ship x pot value
;ship1y ; keeps 1st ship y pot value

;ship2x ; keeps 2nd ship x pot value
;ship2y ; keeps 2nd ship y pot value

;ship3x ; keeps 3rd ship x pot value
;ship3y ; keeps 3rd ship y pot value

;ship4x ; keeps 4th ship x pot value
;ship4y ; keeps 4th ship y pot value

;mine1x   ; keeps 1st mine x pot value
;mine1y   ; keeps 1st mine y pot value

;mine2x   ; keeps 2nd mine x pot value
;mine2y   ; keeps 2nd mine y pot value 

;mine3x   ; keeps 3rd mine x pot value
;mine3y   ; keeps 3rd mine y pot value 

;mine4x   ; keeps 4th mine x pot value
;mine4y   ; keeps 4th mine y pot value 

SHIP1X	EQU 0x20000400	
SHIP1Y	EQU 0x20000404
SHIP2X	EQU 0x20000408	
SHIP2Y	EQU 0x2000040C
SHIP3X	EQU 0x20000410	
SHIP3Y	EQU 0x20000414
SHIP4X	EQU 0x20000418	
SHIP4Y	EQU 0x2000041C
SHIPWAR1X	EQU 0x20000420	
SHIPWAR1Y	EQU 0x20000424
SHIPWAR2X	EQU 0x20000428	
SHIPWAR2Y	EQU 0x2000042C
SHIPWAR3X	EQU 0x20000430	
SHIPWAR3Y	EQU 0x20000434
SHIPWAR4X	EQU 0x20000438	
SHIPWAR4Y	EQU 0x2000043C		
CIVILNUMBER	EQU 0x20000440	
MINE1X	EQU 0x20000450	
MINE1Y	EQU 0x20000454
MINE2X	EQU 0x20000458	
MINE2Y	EQU 0x2000045C
MINE3X	EQU 0x20000460	
MINE3Y	EQU 0x20000464
MINE4X	EQU 0x20000468	
MINE4Y	EQU 0x2000046C	
finalcheck	EQU	0x20000470	
MINENUMBER	EQU	0x20000480	
__main	    	PROC
				BL INIT_NOKIA
				BL CONFIG_NOKIA				
				BL NokiaClear
				BL PrintMap
				BL INIT_SYSTICK_TIMER
				BL INIT_SWITCHES
				;BL INIT_COUNTER
			;	MOV R6, #0XFFF

WAITPRESS1		LDR 		R1, =PFdata ; load R1 with PFdata address
				LDR 		R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS1 		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS1 		;BUTTONS ARE NOT PRESSED
				
				
				CMP R2,#0x10	;If (SW1 is pressed) 
				BEQ WAR1
				
CIVIL1			BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =SHIP1X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =SHIP1Y
				STR R8, [R0]
				MOV R9, #1
				B	BUTTON2
				
WAR1			BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =SHIPWAR1X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =SHIPWAR1Y
				STR R8, [R0]	
				MOV R9, #2
				B	BUTTON2
				
WAITPRESS2		LDR 		R1, =PFdata ; load R1 with PFdata address
				LDR 		R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS2 		;BUTTONS ARE NOT PRESSED			
				;BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS2		;BUTTONS ARE NOT PRESSED
				
				CMP R2,#0x01
				BNE WAR2
				
CIVIL2			BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =SHIP2X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =SHIP2Y
				STR R8, [R0]
				
				MOV R10, #1
				B	BUTTON2	
				
WAR2			BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =SHIPWAR2X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =SHIPWAR2Y
				STR R8, [R0]
				MOV R10, #2
				B	BUTTON2
				
				
WAITPRESS3		LDR 		R1, =PFdata ; load R1 with PFdata address
				LDR 		R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS3 		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS3 		;BUTTONS ARE NOT PRESSED
				CMP R2,#0x10 
				BEQ WAR3
				
CIVIL3			BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =SHIP3X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =SHIP3Y
				STR R8, [R0]
				MOV R11, #1
				B	BUTTON2		
WAR3			BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =SHIPWAR3X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =SHIPWAR3Y
				STR R8, [R0]	
				MOV R11, #2		
				B	BUTTON2
				
WAITPRESS4		LDR 		R1, =PFdata ; load R1 with PFdata address
				LDR 		R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS4 		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS4 		;BUTTONS ARE NOT PRESSED
				CMP R2,#0x10 
				BEQ WAR4
				
				ORR R2, R11, R10
				ORR R2, R2, R9
				ANDS R2, #2
				BEQ WAITPRESS4
				
				
CIVIL4			BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =SHIP4X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =SHIP4Y
				STR R8, [R0]
				MOV R12, #1
				B	BUTTON2	
				
WAR4			BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =SHIPWAR4X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =SHIPWAR4Y
				STR R8, [R0]	
				MOV R12, #2			
				B	BUTTON2				
				
				
				
WAITPRESS5		LDR 	R1, =PFdata ; load R1 with PFdata address
				LDR 	R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS5 		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS5 		;BUTTONS ARE NOT PRESSED
				B	BUTTON2	
		
				
WAITPRESS6		LDR 	R1, =PFdata ; load R1 with PFdata address
				LDR 	R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS6		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS6		;BUTTONS ARE NOT PRESSED
				
				BL INIT_COUNTER	
				B	BUTTON2					

;WAITPRESS7		LDR 	R1, =PFdata ; load R1 with PFdata address
;				LDR 	R2, [R1] ; read data from Port F
;				CMP R2,#0x11
;				BEQ WAITPRESS7		;BUTTONS ARE NOT PRESSED			
;				BL DELAY100m
;				LDR R2, [R1] ; read data from Port F	
;				CMP R2,#0x11
;				BEQ WAITPRESS7		;BUTTONS ARE NOT PRESSED
;				B	BUTTON2	

WAITPRESS7		LDR 	R1, =PFdata ; load R1 with PFdata address
				LDR 	R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS7		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS7		;BUTTONS ARE NOT PRESSED
								
				BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =MINE1X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =MINE1Y
				STR R8, [R0]
								
				B	BUTTON2	
				
WAITPRESS8		LDR 	R1, =PFdata ; load R1 with PFdata address
				LDR 	R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS8		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS7		;BUTTONS ARE NOT PRESSED
								
				BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =MINE2X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =MINE2Y
				STR R8, [R0]
								
				B	BUTTON2	

WAITPRESS9		LDR 	R1, =PFdata ; load R1 with PFdata address
				LDR 	R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS9		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS9		;BUTTONS ARE NOT PRESSED
								
				BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =MINE3X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =MINE3Y
				STR R8, [R0]
								
				B	BUTTON2	
				
WAITPRESS10		LDR 	R1, =PFdata ; load R1 with PFdata address
				LDR 	R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS10		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS10		;BUTTONS ARE NOT PRESSED
								
				BL	READ_POT2	;One of the buttons is pressed
				LDR R0, =MINE4X ;Store the pot values 
				STR R8, [R0]				
				BL	READ_POT1
				LDR R0, =MINE4Y
				STR R8, [R0]								
				B	BUTTON2	
				
WAITPRESS11		LDR 	R1, =PFdata ; load R1 with PFdata address ;;RETURN TO START
				LDR 	R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BEQ WAITPRESS11		;BUTTONS ARE NOT PRESSED			
				BL DELAY100m
				LDR R2, [R1] ; read data from Port F	
				CMP R2,#0x11
				BEQ WAITPRESS11		;BUTTONS ARE NOT PRESSED
				CMP R7,#0xFF
				BNE	WAITPRESS11 	
				BL NokiaClear
				BL PrintMap
				MOV R0,#0
				MOV R1,#0
				MOV R2,#0
				MOV R3,#0
			;	MOV R4,#0
				MOV R5,#0
				MOV R6,#0
				MOV R7,#0
				MOV R8,#0
				MOV R9,#0
				MOV R10,#0
				MOV R11,#0
				MOV R12,#0
				LDR R1, =SYSCTL_RCGCTIMER ; Start Timer0
				LDR R2, [R1]
				BIC R2, R2, #0x01
				STR R2, [R1]
				LDR R1,= SHIP1X
				STR R0,[R1,#0]
				STR R0,[R1,#4]
				STR R0,[R1,#8]
				STR R0,[R1,#12]
				STR R0,[R1,#16]
				STR R0,[R1,#20]
				STR R0,[R1,#24]
				STR R0,[R1,#28]
				LDR R1,=SHIPWAR1X
				STR R0,[R1,#0]
				STR R0,[R1,#4]
				STR R0,[R1,#8]
				STR R0,[R1,#12]
				STR R0,[R1,#16]
				STR R0,[R1,#20]
				STR R0,[R1,#24]
				STR R0,[R1,#28]
				LDR R1,= MINE1X
				STR R0,[R1,#0]
				STR R0,[R1,#4]
				STR R0,[R1,#8]
				STR R0,[R1,#12]
				STR R0,[R1,#16]
				STR R0,[R1,#20]
				STR R0,[R1,#24]
				STR R0,[R1,#28]
				LDR R1,= MINENUMBER
				STR R0,[R1]
				LDR R1,= finalcheck
				STR R0,[R1]
WaitRelaseFinal	LDR R1, =PFdata ; load R1 with PFdata address ;;RETURN TO START
				LDR R2, [R1] ; read data from Port F
				CMP R2,#0x11
				BNE WaitRelaseFinal		;BUTTONS ARE NOT PRESSED
				B	__main	
								

				
BUTTON2			LDR R1, =PFdata ; load R1 with PFdata address
WAITRELEASE1	LDR	R0, [R1] ; read data from Port F	
				CMP R2,R0
				BEQ WAITRELEASE1
				ADD R7,#1
			;	ADD R6,#1
				CMP R7,#1
				BEQ WAITPRESS2
				CMP R7,#2
				BEQ WAITPRESS3
				CMP R7,#3
				BEQ WAITPRESS4
				CMP R7,#4
				BEQ WAITPRESS5
				CMP R7,#5
				BEQ WAITPRESS6
				CMP R7,#6
				BEQ WAITPRESS7
				CMP R7,#7
				BEQ WAITPRESS7
				CMP R7,#8    
				BEQ WAITPRESS8
				CMP R7,#9    
				BEQ WAITPRESS8
				CMP R7,#10    
				BEQ WAITPRESS9
				CMP R7,#11    
				BEQ WAITPRESS10
				B WAITPRESS11
				
;BUTTON1			LDR 		R1, =PFdata ; load R1 with PFdata address
;WAITRELEASE2	LDR	R3, [R1] ; read data from Port F	
;				CMP R2,R3
;				BEQ WAITRELEASE2
;				ADD R7,#1
;				ADD R5,#1
;				CMP R7,#1
;				BEQ WAITPRESS2
;				CMP R7,#2
;				BEQ WAITPRESS3
;				CMP R7,#3
;				BEQ WAITPRESS4
;				CMP R7,#4
;				BEQ WAITPRESS5
		
forever			B forever					
				ENDP
				ALIGN
				END
					