GPIO_PORTF_DIR       	EQU 0x40025400 				; Since offset is 0x400 (Directive)
SYSCTL_RCGCGPIO      	EQU 0x400FE608				; For activating clock of portB
GPIO_PORTF_AFSEL     	EQU 0x40025420				; Since offset is 0x420 (Alternate func. select)
GPIO_PORTF_DEN       	EQU 0x4002551C				; Since offset is 0x51c (Digital enable)
GPIO_PORTF_PUR       	EQU 0x40025510				; Since offset is 0x514
PFdata 					EQU 0x400253FC 				; Port F Data address	
Lock_Key 				EQU 0x4C4F434B				; Unlock code for all Lock Registers
PORTF_LOCK_R 			EQU 0x40025520 				; Port F Lock Register
PORTF_GPIOCR 			EQU 0x40025524 				; Port F Lock Register	
	
;LABEL				DIRECTIVE	VALUE		COMMENT
					AREA 		routines , CODE, READONLY
					THUMB
					EXPORT		 INIT_SWITCHES

INIT_SWITCHES	 	PROC
					LDR			R1,=SYSCTL_RCGCGPIO			; To activate clock
					LDR			R0,[R1] 
					ORR			R0,R0,#0x20      			; To activate clock for port B
					STR			R0,[R1]
					NOP
					NOP					
					NOP
					LDR R1, =PORTF_LOCK_R ; load R1 with PORTF_LOCK_R address
					LDR R0, =Lock_Key ; load R0 with lock key
					STR R0, [R1] ; store key in PORTF_LOCK_R
					
					LDR R1, =PORTF_GPIOCR ; Enable digital (vs. Analog) function
					LDR R0, [R1]
					MOV R0, #0x01
					STR R0, [R1] 
					
					LDR			R1,=GPIO_PORTF_DIR			; To set direction register
					LDR			R0,[R1]
					BIC			R0,R0,#0x11	   				; Bits 0 to 4 are set as inputs
					STR			R0,[R1]	 
					LDR			R1,=GPIO_PORTF_AFSEL		; To set AFSEL
					LDR			R0,[R1]
					BIC			R0,R0,#0x11	    			; No AFSEL for PF0 and PF4
					STR			R0,[R1]					
					LDR			R1,=GPIO_PORTF_DEN			; To enable digital port
					LDR			R0,[R1]
					ORR			R0,R0,#0x11					; Enable PF0 and PF4
					STR			R0,[R1]
					
										
					LDR			R1,=GPIO_PORTF_PUR		; To set AFSEL
					LDR			R0,[R1]
					ORR			R0,R0,#0x11	    		; set PF0 and PF4
					STR			R0,[R1]
					
					; Read Switches
;Start				LDR 		R1, =PFdata ; load R1 with PFdata address
;					LDR 		R0, [R1] ; read data from Port F
;					AND 		R0, #0x11 ; 11:no pressed, 01:sw1 pressed, 10:sw2 pressed
;								; (bits 4 and 0 respectively)
;					B			Start
					

					ALIGN
					BX  		LR					
					ENDP					
					END