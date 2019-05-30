; GPIO Registers
RCGCGPIO    EQU 0x400FE608 ; GPIO clock register
;PORT E base address EQU 0x40024000
PORTE_DEN   EQU 0x4002451C ; Digital Enable
PORTE_PCTL  EQU 0x4002452C ; Alternate function select
PORTE_AFSEL EQU 0x40024420 ; Enable Alt functions
PORTE_AMSEL EQU 0x40024528 ; Enable analog
PORTE_DIR	EQU 0x40024400 ; 

; ADC Registers
RCGCADC     EQU 0x400FE638 ; ADC clock register
ADC0_ACTSS  EQU 0x40038000 ; Sample sequencer (ADC0 base address)
ADC0_EMUX   EQU 0x40038014 ; Trigger select
ADC0_SSMUX3 EQU 0x400380A0 ; Input channel select
ADC0_SSCTL3 EQU 0x400380A4 ; Sample sequence control
ADC0_PP     EQU 0x40038FC4 ; Sample rate


ADC0_RIS			EQU 0x40038004 
ADC0_PSSI			EQU 0x40038028
ADC0_SSFIFO3 		EQU 0x400380A8 
ADC0_ISC			EQU 0x4003800C 


			AREA    	main, READONLY, CODE
			THUMB
			EXPORT 		READ_POT1
			EXTERN      INIT_GPIO_POT1
			EXTERN		INIT_ADC_POT1
			EXTERN		CONVRT
			EXTERN		OutStr
					
READ_POT1	    PROC
			PUSH {LR}
			;;;;;;;;;;;;;;;INIT_GPIO_POT1;;;;;;;;;;;;;;;;;;;;;;;;;
			LDR R1, =RCGCGPIO ; Start clock of Port E
			LDR R0, [R1]
			ORR R0, R0, #0x10 ; Set bit 4 to enable port E clock
			STR R0, [R1]
			NOP
			NOP
			NOP ; Let clock stabilize			
			
			LDR R1, =PORTE_DIR ; Make PE3 input
			LDR R0, [R1]
			BIC R0, R0, #0x08
			STR R0, [R1]
			
			; Enable alternate functions
			LDR R1, =PORTE_AFSEL ; Enable alternate function for PE3
			LDR R0, [R1]
			ORR R0, R0, #0x08 ; set bit 3 to enable alt functions on PE3
			STR R0, [R1]
			; PCTL does not have to be configured
			; since ADC0 is automatically selected when
			; port pin is set to analog.
			
			LDR R1, =PORTE_DEN ; Disable digital function of PE3 
			LDR R0, [R1]
			BIC R0, R0, #0x08 ; clear bit 3 to disable analog on PE3
			STR R0, [R1]
			
			
			LDR R1, =PORTE_AMSEL ;Enable analog function of PE3 
			LDR R0, [R1]
			ORR R0, R0, #0x08 ; set bit 3 to enable analog on PE3
			STR R0, [R1]
			;;;;;;;;;;;;;;;INIT_GPIO_POT1;;;;;;;;;;;;;;;;;;;;;;;;;




			;;;;;;;;;;;;;;;INIT_ADC_POT1;;;;;;;;;;;;;;;;;;;;;;;;;
			LDR R1, =RCGCADC ; Enable ADC0 clock 
			LDR R0, [R1]
			ORR R0, R0, #0x01 ; set bit 0 to enable ADC0 clock
			STR R0, [R1]
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP ; Let clock stabilize
			LDR R1, =ADC0_ACTSS ;Disable sequencer 3 while ADC
			LDR R0, [R1]
			BIC R0, R0, #0x08 ; clear bit 3 to disable seq 3
			STR R0, [R1]

			LDR R1, =ADC0_EMUX ;Select Event Multiplexer(trigger source) 
			LDR R0, [R1]		  ;as processor trigger for SS3	
			BIC R0, R0, #0xF000 
			STR R0, [R1] 
		
			LDR R1, =ADC0_SSMUX3 ;Select input channel as AIN0
			LDR R0, [R1]
			BIC R0, R0, #0x000F 
			STR R0, [R1]		
		
			LDR R1, =ADC0_SSCTL3 ;Config Sample Sequencer Control 3. IE0=1, END0=1
			LDR R0, [R1]	     ;IE0:Sample Interrupt Enable =1
			ORR R0, R0, #0x06    ;END0:Sample is End of Sequence=  1
			STR R0, [R1]		 ;--> First sample is the last sample of seqence			
			
			; Set sample rate
			LDR R1, =ADC0_PP
			LDR R0, [R1]
			ORR R0, R0, #0x01 ;Set sample rate as 125 kilo-samples per second (ksps)
			STR R0, [R1]
			
			; Done with setup, enable sequencer
			LDR R1, =ADC0_ACTSS ;Enable sequencer 3
			LDR R0, [R1]
			ORR R0, R0, #0x08 
			STR R0, [R1] ; sampling enabled but not initiated yet
			;;;;;;;;;;;;;;;INIT_ADC_POT1;;;;;;;;;;;;;;;;;;;;;;;;;
			
								
	        ;Initiate sampling by enabling sequencer 3 in ADC0_PSSI
InitSamp    LDR			R1,=ADC0_PSSI ;Initiate ss3(sample sequencer 3)
			LDR			R0,[R1]
			ORR			R0,R0,#0x08 
			STR			R0,[R1]


WaitSamp	LDR			R1,=ADC0_RIS ;Check ADC Raw Interrupt Status register  
			LDR			R0,[R1]		 ;whether INR3 is 1(sample is completed)
			ANDS		R0,R0,#0x08 ; isolate bit 3
			BEQ			WaitSamp

			LDR			R1,=ADC0_SSFIFO3  ;Read ADC-input from SSFIFO3	
			LDR			R8,[R1]   		  ;Store it at R4
			
			LDR			R1,=ADC0_ISC ;Set Interrupt Status and Clear register
			LDR			R0,[R1]		 	; to continue sampling
			ORR			R0,R0,#0x08
			STR			R0,[R1]		
			POP {LR}
			BX	LR			
			ENDP
			ALIGN
			END
			