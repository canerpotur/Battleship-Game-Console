ship1x		EQU 0x20000400	
ship1y		EQU 0x20000404
ship2x		EQU 0x20000408	
ship2y		EQU 0x2000040C
ship3x		EQU 0x20000410	
ship3y		EQU 0x20000414
ship4x		EQU 0x20000418	
ship4y		EQU 0x2000041C
	
shipwar1x	EQU 0x20000420		; keeps 1st ship x pot value
shipwar1y	EQU 0x20000424      ; keeps 1st ship y pot value
shipwar2x	EQU 0x20000428	    ; keeps 2nd ship x pot value
shipwar2y	EQU 0x2000042C      ; keeps 2nd ship y pot value
shipwar3x	EQU 0x20000430	    ; keeps 3rd ship x pot value
shipwar3y	EQU 0x20000434      ; keeps 3rd ship y pot value
shipwar4x	EQU 0x20000438	    ; keeps 4th ship x pot value
shipwar4y	EQU 0x2000043C		; keeps 4th ship y pot value
                                
mine1x		EQU 0x20000450	    
mine1y		EQU 0x20000454      
mine2x		EQU 0x20000458	
mine2y		EQU 0x2000045C
mine3x		EQU 0x20000460	
mine3y		EQU 0x20000464
mine4x		EQU 0x20000468	
mine4y		EQU 0x2000046C
	
finalcheck	EQU	0x20000470

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			
			EXPORT	MINE_CHECK



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



MINE_CHECK		PROC
				PUSH {LR}
				PUSH {R0-R12}
start
				MOV		R7,#0
				MOV		R8,R6			;R8 keeps mine number
										;R6 will count mine

Firstship		CMP		R9,#2			;R9 keeps 1st ship type ( Civil or Battle)
				BEQ		warcheck1jmp

civilcheck1

checkminec1		SUB		R6,#1
				LDR		R2,=ship1x
				LDR		R1,[R2]
				LDR		R4,=mine1x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec2			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec2
				
				LDR		R2,=ship1y
				LDR		R1,[R2]
				LDR		R4,=mine1y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec2			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec2
				
				B		Secondship			;Mine hit this ship

warcheck1jmp	B		warcheck1
checkminec2		CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Secondshipjmpss				
				SUB		R6,#1
				
				LDR		R2,=ship1x
				LDR		R1,[R2]
				LDR		R4,=mine2x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec3			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec3
				
				LDR		R2,=ship1y
				LDR		R1,[R2]
				LDR		R4,=mine2y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec3			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec3
				
				B		Secondship			;Mine hit this ship
Secondshipjmpss	B		Secondship				
checkminec3		CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Secondshipjmp
				SUB		R6,#1

				LDR		R2,=ship1x
				LDR		R1,[R2]
				LDR		R4,=mine3x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec4			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec4
				
				LDR		R2,=ship1y
				LDR		R1,[R2]
				LDR		R4,=mine3y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec4			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec4
				
				B		Secondship			;Mine hit this ship
				
checkminec4		CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Secondshipjmp

				LDR		R2,=ship1x
				LDR		R1,[R2]
				LDR		R4,=mine4x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				ADDHI	R7,#1
				BGE		Secondshipjmp			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				ADDLO	R7,#1
				BLO		Secondshipjmp
				
				LDR		R2,=ship1y
				LDR		R1,[R2]
				LDR		R4,=mine4y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5	
				ADDHI	R7,#1
				BGE		Secondshipjmp			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				ADDLO	R7,#1
				BLO 	Secondshipjmp
				
				B		Secondship			;Mine hit this ship
Secondshipjmp	B		Secondship
warcheck1		; THIS STATE WILL CHECK 4 MINE FOR 1st ship

checkmine1		SUB		R6,#1
				LDR		R2,=shipwar1x
				LDR		R1,[R2]
				LDR		R4,=mine1x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine2			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine2
				
				LDR		R2,=shipwar1y
				LDR		R1,[R2]
				LDR		R4,=mine1y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine2			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine2
				LTORG
				ADD		R7,#1				;Mine hit this ship
				B		Secondship

checkmine2		CMP		R6,#0
				BEQ		Secondship
				SUB		R6,#1
				
				LDR		R2,=shipwar1x
				LDR		R1,[R2]
				LDR		R4,=mine2x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine3			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine3
				
				LDR		R2,=shipwar1y
				LDR		R1,[R2]
				LDR		R4,=mine2y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine3			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine3
				
				ADD		R7,#1				;Mine hit this ship
				B		Secondship

				
checkmine3		CMP		R6,#0
				BEQ		Secondship
				SUB		R6,#1
				
				LDR		R2,=shipwar1x
				LDR		R1,[R2]
				LDR		R4,=mine3x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine4			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine4
				
				LDR		R2,=shipwar1y
				LDR		R1,[R2]
				LDR		R4,=mine3y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine4			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine4
				
				ADD		R7,#1				;Mine hit this ship
				B		Secondship

checkmine4		CMP		R6,#0
				BEQ		Secondship

				LDR		R2,=shipwar1x
				LDR		R1,[R2]
				LDR		R4,=mine4x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		Secondship			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		Secondship
				
				LDR		R2,=shipwar1y
				LDR		R1,[R2]
				LDR		R4,=mine4y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		Secondship			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	Secondship
				
				ADD		R7,#1				;Mine hit this ship
				B		Secondship

;/************** CHECK FOR SECOND SHIP **************************/



Secondship		CMP		R10,#2			;R10 keeps 2nd ship type ( Civil or Battle)
				MOV     R6,R8			;Mine number will store in R6 again
				BEQ		warcheck2jmp

civilcheck2

checkminec21	SUB		R6,#1
				LDR		R2,=ship2x
				LDR		R1,[R2]
				LDR		R4,=mine1x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec22			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec22
				
				LDR		R2,=ship2y
				LDR		R1,[R2]
				LDR		R4,=mine1y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec22			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec22
				
				B		Thirdship			;Mine hit this ship
warcheck2jmp	B		warcheck2
checkminec22	CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Thirdshipjmpss				
				SUB		R6,#1
				
				LDR		R2,=ship2x
				LDR		R1,[R2]
				LDR		R4,=mine2x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec23			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec23
				
				LDR		R2,=ship2y
				LDR		R1,[R2]
				LDR		R4,=mine2y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec23			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec23
				
				B		Thirdship			;Mine hit this ship
Thirdshipjmpss	B		Thirdshipjmp				
checkminec23	CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Thirdshipjmp
				SUB		R6,#1

				LDR		R2,=ship2x
				LDR		R1,[R2]
				LDR		R4,=mine3x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec24			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec24
				
				LDR		R2,=ship2y
				LDR		R1,[R2]
				LDR		R4,=mine3y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec24			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec24
				
				B		Thirdship			;Mine hit this ship
				
checkminec24	CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Thirdshipjmp

				LDR		R2,=ship2x
				LDR		R1,[R2]
				LDR		R4,=mine4x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				ADDHI	R7,#1
				BGE		Thirdshipjmp			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				ADDLO	R7,#1
				BLO		Thirdshipjmp
				
				LDR		R2,=ship2y
				LDR		R1,[R2]
				LDR		R4,=mine4y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5	
				ADDHI	R7,#1
				BGE		Thirdshipjmp			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				ADDLO	R7,#1
				BLO 	Thirdshipjmp
				
				B		Thirdship			;Mine hit this ship
Thirdshipjmp	B		Thirdship
warcheck2		; THIS STATE WILL CHECK 4 MINE FOR 1st ship

checkmine21		SUB		R6,#1
				LDR		R2,=shipwar2x
				LDR		R1,[R2]
				LDR		R4,=mine1x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine22			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine22
				
				LDR		R2,=shipwar2y
				LDR		R1,[R2]
				LDR		R4,=mine1y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine22			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine22
				
				ADD		R7,#1				;Mine hit this ship
				B		Thirdship

checkmine22		CMP		R6,#0
				BEQ		Thirdshipjmp
				SUB		R6,#1
				
				LTORG
				
				LDR		R2,=shipwar2x
				LDR		R1,[R2]
				LDR		R4,=mine2x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine23			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine23
				
				LDR		R2,=shipwar2y
				LDR		R1,[R2]
				LDR		R4,=mine2y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine23			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine23
				
				ADD		R7,#1				;Mine hit this ship
				B		Thirdship
Thirdshipjmps	B		Thirdship				
checkmine23		CMP		R6,#0
				BEQ		Thirdship
				SUB		R6,#1
				
				LDR		R2,=shipwar2x
				LDR		R1,[R2]
				LDR		R4,=mine3x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine24			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine24
				
				LDR		R2,=shipwar2y
				LDR		R1,[R2]
				LDR		R4,=mine3y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine24			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine24
				
				ADD		R7,#1				;Mine hit this ship
				B		Thirdship

checkmine24		CMP		R6,#0
				BEQ		Thirdship

				LDR		R2,=shipwar2x
				LDR		R1,[R2]
				LDR		R4,=mine4x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		Thirdship			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		Thirdship
				
				LDR		R2,=shipwar2y
				LDR		R1,[R2]
				LDR		R4,=mine4y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		Thirdship			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	Thirdship
				
				ADD		R7,#1				;Mine hit this ship
				B		Thirdship

;/************** START CHECK FOR THIRD SHIP **************************/



Thirdship		CMP		R11,#2			;R10 keeps 2nd ship type ( Civil or Battle)
				MOV     R6,R8			;Mine number will store in R6 again
				BEQ		warcheck3jmp

civilcheck3

checkminec31	SUB		R6,#1
				LDR		R2,=ship3x
				LDR		R1,[R2]
				LDR		R4,=mine1x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec32			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec32
				
				LDR		R2,=ship3y
				LDR		R1,[R2]
				LDR		R4,=mine1y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec32			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec32
				
				B		Fourthship			;Mine hit this ship
warcheck3jmp	B		warcheck3
checkminec32	CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Fourthshipjmpss				
				SUB		R6,#1
				
				LDR		R2,=ship3x
				LDR		R1,[R2]
				LDR		R4,=mine2x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec33			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec33
				
				LDR		R2,=ship3y
				LDR		R1,[R2]
				LDR		R4,=mine2y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec33			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec33
				
				B		Fourthship			;Mine hit this ship
Fourthshipjmpss	B		Fourthshipjmp				
checkminec33	CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Fourthshipjmp
				SUB		R6,#1

				LDR		R2,=ship3x
				LDR		R1,[R2]
				LDR		R4,=mine3x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec34			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec34
				
				LDR		R2,=ship3y
				LDR		R1,[R2]
				LDR		R4,=mine3y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec34			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec34
				
				B		Fourthship			;Mine hit this ship
				
checkminec34	CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Fourthshipjmp

				LDR		R2,=ship3x
				LDR		R1,[R2]
				LDR		R4,=mine4x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				ADDHI	R7,#1
				BGE		Fourthshipjmp			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				ADDLO	R7,#1
				BLO		Fourthshipjmp
				
				LDR		R2,=ship3y
				LDR		R1,[R2]
				LDR		R4,=mine4y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5	
				ADDHI	R7,#1
				BGE		Fourthshipjmp			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				ADDLO	R7,#1
				BLO 	Fourthshipjmp
				
				B		Fourthship			;Mine hit this ship
Fourthshipjmp	B		Fourthship
warcheck3		; THIS STATE WILL CHECK 4 MINE FOR 1st ship

checkmine31		SUB		R6,#1
				LDR		R2,=shipwar3x
				LDR		R1,[R2]
				LDR		R4,=mine1x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine32			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine32
				
				LDR		R2,=shipwar3y
				LDR		R1,[R2]
				LDR		R4,=mine1y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine32			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine32
				
				ADD		R7,#1				;Mine hit this ship
				B		Fourthship

checkmine32		CMP		R6,#0
				BEQ		Fourthshipjmps
				SUB		R6,#1
				
				LDR		R2,=shipwar3x
				LDR		R1,[R2]
				LDR		R4,=mine2x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine33			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine33
				LTORG
				
				LDR		R2,=shipwar3y
				LDR		R1,[R2]
				LDR		R4,=mine2y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine33			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine33
				
				ADD		R7,#1				;Mine hit this ship
				B		Fourthship
Fourthshipjmps	B		Fourthship				
checkmine33		CMP		R6,#0
				BEQ		Fourthship
				SUB		R6,#1
				
				LDR		R2,=shipwar3x
				LDR		R1,[R2]
				LDR		R4,=mine3x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine34			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine34
				
				LDR		R2,=shipwar3y
				LDR		R1,[R2]
				LDR		R4,=mine3y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine34			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine34
				
				ADD		R7,#1				;Mine hit this ship
				B		Fourthship

checkmine34		CMP		R6,#0
				BEQ		Fourthship

				LDR		R2,=shipwar3x
				LDR		R1,[R2]
				LDR		R4,=mine4x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		Fourthship			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		Fourthship
				
				LDR		R2,=shipwar3y
				LDR		R1,[R2]
				LDR		R2,=mine4y
				LDR		R1,[R2]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		Fourthship			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	Fourthship
				
				ADD		R7,#1				;Mine hit this ship
				B		Fourthship

;/************** START CHECK FOR FOURTH SHIP **************************/



Fourthship		CMP		R12,#2			;R10 keeps 2nd ship type ( Civil or Battle)
				MOV     R6,R8			;Mine number will store in R6 again
				BEQ		warcheck4jmp

civilcheck4

checkminec41	SUB		R6,#1
				LDR		R2,=ship4x
				LDR		R1,[R2]
				LDR		R4,=mine1x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec42			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec42
				
				LDR		R2,=ship4y
				LDR		R1,[R2]
				LDR		R4,=mine1y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec42			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec42
				
				B		Final			;Mine hit this ship
warcheck4jmp	B		warcheck4
checkminec42	CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Finaljmpss				
				SUB		R6,#1
				
				LDR		R2,=ship4x
				LDR		R1,[R2]
				LDR		R4,=mine2x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec43			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec43
				
				LDR		R2,=ship4y
				LDR		R1,[R2]
				LDR		R4,=mine2y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec43			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec43
				
				B		Final			;Mine hit this ship
Finaljmpss		B		Finaljmp				
checkminec43	CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Finaljmp
				SUB		R6,#1

				LDR		R2,=ship4x
				LDR		R1,[R2]
				LDR		R4,=mine3x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkminec44			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkminec44
				
				LDR		R2,=ship4y
				LDR		R1,[R2]
				LDR		R4,=mine3y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkminec44			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkminec44
				
				B		Final			;Mine hit this ship
				
checkminec44	CMP		R6,#0
				ADDEQ	R7,#1
				BEQ		Finaljmp

				LDR		R2,=ship4x
				LDR		R1,[R2]
				LDR		R4,=mine4x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				ADDHI	R7,#1
				BGE		Finaljmp			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				ADDLO	R7,#1
				BLO		Finaljmp
				
				LDR		R4,=ship4y
				LDR		R5,[R4]
				LDR		R4,=mine4y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5	
				ADDHI	R7,#1
				BGE		Finaljmp			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				ADDLO	R7,#1
				BLO 	Finaljmp
				
				B		Final			;Mine hit this ship
Finaljmp		B		Final
warcheck4		; THIS STATE WILL CHECK 4 MINE FOR 1st ship

checkmine41		SUB		R6,#1
				LDR		R2,=shipwar4x
				LDR		R1,[R2]
				LDR		R4,=mine1x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				
				CMP		R1,R5
				BGE		checkmine42			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine42
				
				LDR		R2,=shipwar4y
				LDR		R1,[R2]
				LDR		R4,=mine1y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine42			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine42
				
				ADD		R7,#1				;Mine hit this ship
				B		Final

checkmine42		CMP		R6,#0
				BEQ		Finaljmps
				SUB		R6,#1
				
				LDR		R2,=shipwar4x
				LDR		R1,[R2]
				LDR		R4,=mine2x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine43			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine43
				
				LDR		R2,=shipwar4y
				LDR		R1,[R2]
				LDR		R4,=mine2y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine43			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine43
				LTORG
				
				ADD		R7,#1				;Mine hit this ship
				B		Final
Finaljmps		B		Final				
checkmine43		CMP		R6,#0
				BEQ		Final
				SUB		R6,#1
				
				LDR		R2,=shipwar4x
				LDR		R1,[R2]
				LDR		R4,=mine3x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		checkmine44			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		checkmine44
				
				LDR		R2,=shipwar4y
				LDR		R1,[R2]
				LDR		R4,=mine3y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		checkmine44			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	checkmine44
				
				ADD		R7,#1				;Mine hit this ship
				B		Final

checkmine44		CMP		R6,#0
				BEQ		Final

				LDR		R2,=shipwar4x
				LDR		R1,[R2]
				LDR		R4,=mine4x
				LDR		R5,[R4]
				MOV		R2,#75
				UDIV	R1, R1, R2
				MOV		R2,#66
				UDIV	R5, R5, R2
				CMP		R1,R5
				BGE		Final			;control for x position
				ADD		R1,#7
				CMP		R1,R5
				BLO		Final
				
				LDR		R2,=shipwar4y
				LDR		R1,[R2]
				LDR		R4,=mine4y
				LDR		R5,[R4]
				MOV		R2,#169
				UDIV	R1, R1, R2
				MOV		R2,#132
				UDIV	R5, R5, R2
				CMP		R1,R5		
				BGE		Final			;control for y position
				ADD		R1,#7
				CMP 	R1,R5
				BLO 	Final
				
				ADD		R7,#1				;Mine hit this ship
				B		Final

Final			CMP     R7,#4
				BNE		winP1
				
				MOV		R4,#1			; IF p2 win R4 =1
				LDR		R3,=finalcheck
				STR		R4,[R3]
				B		finish
winP1			MOV		R4,#0			; IF p1 win R4 =0
				LDR		R3,=finalcheck
				STR		R4,[R3]
finish				

				POP {R0-R12}
				POP {LR}
				
				ENDP
				BX	LR

				ALIGN
				END
