; Routine for creating a pulse train using interrupts
; This uses Channel 0, and a 1MHz Timer Clock (_TAPR = 15 )
; Uses Timer0A to create pulse train on PF2

;Nested Vector Interrupt Controller registers
NVIC_EN0_INT19		EQU 0x00080000 ; Interrupt 19 enable
NVIC_EN0			EQU 0xE000E100 ; IRQ 0 to 31 Set Enable Register
NVIC_PRI4			EQU 0xE000E410 ; IRQ 16 to 19 Priority Register
	
; 16/32 Timer Registers
TIMER0_CFG			EQU 0x40030000
TIMER0_TAMR			EQU 0x40030004
TIMER0_CTL			EQU 0x4003000C
TIMER0_IMR			EQU 0x40030018
TIMER0_RIS			EQU 0x4003001C ; Timer Interrupt Status
TIMER0_ICR			EQU 0x40030024 ; Timer Interrupt Clear
TIMER0_TAILR		EQU 0x40030028 ; Timer interval
TIMER0_TAPR			EQU 0x40030038
TIMER0_TAR			EQU	0x40030048 ; Timer register
	
;GPIO Registers
GPIO_PORTF_DATA		EQU 0x40025010 ; Access BIT2
GPIO_PORTF_DIR 		EQU 0x40025400 ; Port Direction
GPIO_PORTF_AFSEL	EQU 0x40025420 ; Alt Function enable
GPIO_PORTF_DEN 		EQU 0x4002551C ; Digital Enable
GPIO_PORTF_AMSEL 	EQU 0x40025528 ; Analog enable
GPIO_PORTF_PCTL 	EQU 0x4002552C ; Alternate Functions


;System Registers
SYSCTL_RCGCGPIO 	EQU 0x400FE608 ; GPIO Gate Control
SYSCTL_RCGCTIMER 	EQU 0x400FE604 ; GPTM Gate Control
	
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			EXPORT  	INIT_COUNTER	; Make available
			EXPORT 	My_Timer0A_Handler
			IMPORT NokiaClear
			IMPORT	ClearMap
			IMPORT	PrintCursor
			IMPORT	READ_POT1
			IMPORT	SetCursor_X
			IMPORT	SetCursor_Y
			IMPORT		PrintShip	
			IMPORT	PRINT
			IMPORT	DELAY100
	
	
CYCLE					EQU	16000000; Theoretically:0x00000014
HALFCYCLE					EQU	8000000; Theoretically:0x00000014

My_Timer0A_Handler	PROC
					PUSH {LR}
					;LDR		R0, =GPIO_PORTF_DATA	;Address of Port-F data value 							
					;LDR		R2,[R0]					;Detect if the output is high or low
					SUB     R6, #1	
			;		CMP		R6, #20					
			;		BEQ		Print20
			;		CMP		R6, #19					
			;		BEQ		Print19
			;		CMP		R6, #18					
			;		BEQ		Print18
			;		CMP		R6, #17					
			;		BEQ		Print17			
				
				 		
Print20			
				CMP		R6, #20					
				BNE		Print19
				
				ADD R7, #1
				
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x42
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x61
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x51
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x46
				BL	PRINT	
				BL  DELAY100
				
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x3E
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x51
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x3E
				BL	PRINT				
				B		done1

Print19			CMP		R6, #19					
				BNE		Print18
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100

				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x06
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x29
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x1E
				BL	PRINT				
				BL  DELAY100
				
				B		done1


Print18			CMP		R6, #18					
				BNE		Print17
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100

				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x36
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x36
				BL	PRINT	
				BL  DELAY100
				
				B		done1
	


Print17			CMP		R6, #17					
				BNE		Print16
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100
				
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x01
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x71
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x09
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x05
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x03
				BL	PRINT	
				BL  DELAY100
				
				B		done	

Print16			CMP		R6, #16					
				BNE		Print15
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100
				
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x3C
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x4A
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x30
				BL	PRINT	
				BL  DELAY100
				
				B		done

Print15			CMP		R6, #15					
				BNE		Print14
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100

				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x27
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x39
				BL	PRINT	
				BL  DELAY100
				
				B		done
				
				
Print14			CMP		R6, #14					
				BNE		Print13
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100

				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x18
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x14
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x12
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x10
				BL	PRINT	
				BL  DELAY100
				
				B		done
				
Print13			CMP		R6, #13					
				BNE		Print12
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100

				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x21
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x41
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x4B
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x31
				BL	PRINT	
				BL  DELAY100
				B		done				
				
Print12			CMP		R6, #12					
				BNE		Print11
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100

				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x42
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x61
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x51
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x46
				BL	PRINT
				BL  DELAY100
				
				B		done				
							
Print11			CMP		R6, #11					
				BNE		Print10
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100

				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100
				B		done					

done1			B done

Print10			CMP		R6, #10					
				BNE		Print9
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100

				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x3E
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x51
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x3E
				BL	PRINT
				BL  DELAY100
				B		done	
				
				
Print9			CMP		R6, #9					
				BNE		Print8
				MOV R4, #73
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100
				
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x06
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x29
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x1E
				BL	PRINT				
				BL  DELAY100
				
				B		done


Print8			CMP		R6, #8					
				BNE		Print7
				
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x36
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x36
				BL	PRINT	
				BL  DELAY100
				
				B		done
				
Print7			CMP		R6, #7					
				BNE		Print6

				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x01
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x71
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x09
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x05
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x03
				BL	PRINT	
				BL  DELAY100
				
				B		done	

Print6			CMP		R6, #6					
				BNE		Print5
			
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x3C
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x4A
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x30
				BL	PRINT	
				BL  DELAY100
				
				B		done

Print5			CMP		R6, #5					
				BNE		Print4
				
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x27
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x39
				BL	PRINT	
				BL  DELAY100
				
				B		done
				
				
Print4			CMP		R6, #4					
				BNE		Print3			
			
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			     MOV R5, #0x18
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x14 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x12
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x10
				BL	PRINT	
				BL  DELAY100
				B		done
				
Print3			CMP		R6, #3					
				BNE		Print2
				
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x21
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x41
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x4B
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x31
				BL	PRINT	
				BL  DELAY100
				B		done				
				
Print2			CMP		R6, #2					
				BNE		Print1
			
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x42
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x61
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x51
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x46
				BL	PRINT
				BL  DELAY100
				
				B		done				
							
Print1			CMP		R6, #1					
				BNE		Print0
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x00
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x42 
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x7f
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x40
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x00
				BL	PRINT	
				BL  DELAY100

				B		done					

Print0			MOV R7, 0xFF
				MOV R4, #79
				BL SetCursor_X	
				MOV R4, #0
				BL SetCursor_Y	
				
			    MOV R5, #0x3E
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x51
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x49
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x45
				BL	PRINT				
				BL  DELAY100
				MOV R5, #0x3E
				BL	PRINT
				BL  DELAY100
				B		done				
									
done				LDR R1, =TIMER0_TAILR 
					ldr R2, =CYCLE; 16MHZ*16.000.000 CYCLE=1 SECOND(THEORETICALLY)
					STR R2, [R1]
					
					LDR		R0,=TIMER0_ICR		 	;Address of Timer Interrupt Clear
					LDR		R1, [R0]				;Value of Timer Interrupt Clear
					ORR		R1,#0x01				
					STR		R1, [R0]				;Clear the timer interrupt
					POP {LR}					
					BX 	LR 
					ENDP
;---------------------------------------------------

INIT_COUNTER	proc
			LDR R1, =SYSCTL_RCGCTIMER ; Start Timer0
			LDR R2, [R1]
			ORR R2, R2, #0x01
			STR R2, [R1]
			NOP ; allow clock to settle
			NOP
			NOP
			LDR R1, =TIMER0_CTL ; disable timer during setup LDR R2, [R1]
			BIC R2, R2, #0x01
			STR R2, [R1]
			LDR R1, =TIMER0_CFG ; set 16 bit mode
			MOV R2, #0x00
			STR R2, [R1]
			LDR R1, =TIMER0_TAMR
			MOV R2, #0x002 ; set to periodic, count down
			STR R2, [R1]
			LDR R1, =TIMER0_TAILR ; initialize match clocks
			LDR R2, =HALFCYCLE
			STR R2, [R1]
			;LDR R1, =TIMER0_TAPR
			;MOV R2, #100 ; divide clock by 16 to
		;	STR R2, [R1] ; get 1us clocks
			LDR R1, =TIMER0_IMR ; enable timeout interrupt
			MOV R2, #0x01
			STR R2, [R1]
; Configure interrupt priorities
; Timer0A is interrupt #19.
; Interrupts 16-19 are handled by NVIC register PRI4.
; Interrupt 19 is controlled by bits 31:29 of PRI4.
; set NVIC interrupt 19 to priority 2
	;		LDR R1, =NVIC_PRI4
	;		LDR R2, [R1]
	;		AND R2, R2, #0x00FFFFFF ; clear interrupt 19 priority
	;		ORR R2, R2, #0x40000000 ; set interrupt 19 priority to 2
	;		STR R2, [R1]
; NVIC has to be enabled
; Interrupts 0-31 are handled by NVIC register EN0
; Interrupt 19 is controlled by bit 19
; enable interrupt 19 in NVIC
			LDR R1, =NVIC_EN0
			MOVT R2, #0x08 ; set bit 19 to enable interrupt 19
			STR R2, [R1]
; Enable timer
			LDR R1, =TIMER0_CTL
			LDR R2, [R1]
			ORR R2, R2, #0x01 ; set bit0 to enable
			STR R2, [R1] ; and bit 1 to stall on debug
			MOV R6, #21
			BX LR ; return
			ENDP
			END