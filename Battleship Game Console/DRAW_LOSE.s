;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			
			EXPORT	DRAW_LOSE
				
			EXTERN	PRINT			
			EXTERN	SetCursor_X
			EXTERN	SetCursor_Y

DRAW_LOSE	PROC
			PUSH {LR}
			PUSH {R0-R12}
			MOV R4, #0
			BL SetCursor_X		;CLEAR 7-68		
			MOV R4, #0
			BL SetCursor_Y
	
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x0F
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x03
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x03
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x0F
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x0F
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x0F
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x03
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x03
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x09
			BL PRINT
			MOV 	R5, #0x09
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x0F
			BL PRINT
			MOV 	R5, #0x09
			BL PRINT
			MOV 	R5, #0x09
			BL PRINT
			MOV 	R5, #0x09
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x0B
			BL PRINT
			MOV 	R5, #0x0B
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x0B
			BL PRINT
			MOV 	R5, #0x0B
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFE
			BL PRINT
			MOV 	R5, #0xFC
			BL PRINT
			MOV 	R5, #0xF8
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x0C
			BL PRINT
			MOV 	R5, #0x9E
			BL PRINT
			MOV 	R5, #0xDE
			BL PRINT
			MOV 	R5, #0xCC
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0xCC
			BL PRINT
			MOV 	R5, #0xDE
			BL PRINT
			MOV 	R5, #0x9E	
			BL PRINT
			MOV 	R5, #0x0C
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			;BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0x60
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE8
			BL PRINT
			MOV 	R5, #0xEC
			BL PRINT
			MOV 	R5, #0xEE
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT			
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT			
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0xEE
			BL PRINT
			MOV 	R5, #0xEC
			BL PRINT
			MOV 	R5, #0xE8
			BL PRINT			
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT			
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE1
			BL PRINT
			MOV 	R5, #0xE1
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x60
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT			
			MOV 	R5, #0x01
			BL PRINT
			MOV 	R5, #0x01
			BL PRINT		
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT			
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT			
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC1
			BL PRINT
			MOV 	R5, #0xC3
			BL PRINT
			MOV 	R5, #0x87
			BL PRINT
			MOV 	R5, #0x0F
			BL PRINT
			MOV 	R5, #0x1F
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0x1F
			BL PRINT
			MOV 	R5, #0x0F
			BL PRINT
			MOV 	R5, #0x87
			BL PRINT
			MOV 	R5, #0xC3
			BL PRINT
			MOV 	R5, #0xC1
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x04
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x1B
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			
			POP {R0-R12}
				POP {LR}		
			ENDP
			BX	LR

			ALIGN
			END