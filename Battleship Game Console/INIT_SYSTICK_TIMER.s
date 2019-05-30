SYSCTRL		EQU 0xE000E010

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			EXPORT  	INIT_SYSTICK_TIMER	; Make available
			

	
INIT_SYSTICK_TIMER			PROC
			PUSH {LR}
			LDR 		R0, =SYSCTRL ; 
			MOV         R1, #0 		; Stop systic counter
			STR         R1, [R0] 
			LDR         R1, = 120000 ; Trigger every xx cycles(xx determines speed) 
			STR         R1, [R0,#4] ; Write reload value register 
			STR         R1, [R0,#8] ; Writing anything will clear this byte 
			MOV         R1, #0x3    ; Choose POSC, enable interrupt and SYSTICK counter 
			STR         R1, [R0]    ; Start counter
			POP {LR}
			BX	LR		
			ENDP	
			ALIGN
			END			
			
			
			
			
			
			