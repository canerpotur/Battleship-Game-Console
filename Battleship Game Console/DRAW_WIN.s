;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			
			EXPORT	DRAW_WIN
				
			EXTERN	PRINT			
			EXTERN	SetCursor_X
			EXTERN	SetCursor_Y

DRAW_WIN	PROC
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
			MOV 	R5, #0x80
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
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0x20
			BL PRINT
			MOV 	R5, #0xC0
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
			MOV 	R5, #0x07
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x0C
			BL PRINT
			MOV 	R5, #0x03
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x03
			BL PRINT
			MOV 	R5, #0x0C
			BL PRINT
			MOV 	R5, #0x08
			BL PRINT
			MOV 	R5, #0x07
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
			MOV 	R5, #0x0F
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x00
			BL PRINT
			MOV 	R5, #0x03
			BL PRINT
			MOV 	R5, #0x0C
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
			MOV 	R5, #0x10
			BL PRINT
			MOV 	R5, #0x30
			BL PRINT
			MOV 	R5, #0x70
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0x70
			BL PRINT
			MOV 	R5, #0xB0
			BL PRINT
			MOV 	R5, #0xD0
			BL PRINT
			MOV 	R5, #0xE0
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xF8
			BL PRINT
			MOV 	R5, #0xF8
			BL PRINT
			MOV 	R5, #0xF0
			BL PRINT
			MOV 	R5, #0xC0
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
			MOV 	R5, #0x64
			BL PRINT
			MOV 	R5, #0xCE
			BL PRINT
			MOV 	R5, #0xCE
			BL PRINT
			MOV 	R5, #0xC4
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0xC4
			BL PRINT
			MOV 	R5, #0xCE
			BL PRINT
			MOV 	R5, #0xCE
			BL PRINT
			MOV 	R5, #0x64
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
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFE
			BL PRINT
			MOV 	R5, #0x7C
			BL PRINT
			MOV 	R5, #0xB8
			BL PRINT
			MOV 	R5, #0xD1
			BL PRINT
			MOV 	R5, #0xE3
			BL PRINT
			MOV 	R5, #0xF7
			BL PRINT
			MOV 	R5, #0xFB
			BL PRINT
			MOV 	R5, #0xFD
			BL PRINT
			MOV 	R5, #0xFE
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
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0x7F
			BL PRINT
			MOV 	R5, #0x3F
			BL PRINT
			MOV 	R5, #0x1F
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
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0x9F
			BL PRINT
			MOV 	R5, #0xEF
			BL PRINT
			MOV 	R5, #0x77
			BL PRINT
			MOV 	R5, #0x7B
			BL PRINT
			MOV 	R5, #0xFD
			BL PRINT
			MOV 	R5, #0xBE
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0x7F
			BL PRINT
			MOV 	R5, #0x7F
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0xBF
			BL PRINT
			MOV 	R5, #0xFF
			BL PRINT
			MOV 	R5, #0x7F
			BL PRINT
			MOV 	R5, #0x5F
			BL PRINT
			MOV 	R5, #0xCF
			BL PRINT
			MOV 	R5, #0x87
			BL PRINT
			MOV 	R5, #0x83
			BL PRINT
			MOV 	R5, #0xC1
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0x80
			BL PRINT
			MOV 	R5, #0xC0
			BL PRINT
			MOV 	R5, #0x40
			BL PRINT
			MOV 	R5, #0x40
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
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x0D
			BL PRINT
			MOV 	R5, #0x06
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
			MOV 	R5, #0x02
			BL PRINT
		
		
			POP {R0-R12}
				POP {LR}	
			ENDP
			BX	LR

			ALIGN
			END