; <<< Use Configuration Wizard in Context Menu >>>
;******************************************************************************
;
; startup_rvmdk.S - Startup code for use with Keil's uVision.
;
; Copyright (c) 2012 Texas Instruments Incorporated.  All rights reserved.
; Software License Agreement
; 
; Texas Instruments (TI) is supplying this software for use solely and
; exclusively on TI's microcontroller products. The software is owned by
; TI and/or its suppliers, and is protected under applicable copyright
; laws. You may not combine this software with "viral" open-source
; software in order to form a larger program.
; 
; THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
; NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
; NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
; A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. TI SHALL NOT, UNDER ANY
; CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
; DAMAGES, FOR ANY REASON WHATSOEVER.
; 
; This is part of revision 9453 of the EK-LM4F120XL Firmware Package.
;
;******************************************************************************
; Edited to conform with ISR names as described in 
;   "Embedded Systems: Introduction to ARM Cortex M Microcontrollers",
;   ISBN: 978-1469998749, Jonathan Valvano, copyright (c) 2012
;   "Embedded Systems: Real Time Interfacing to ARM Cortex M Microcontrollers",
;   ISBN: 978-1463590154, Jonathan Valvano, copyright (c) 2012
;   "Embedded Systems: Real-Time Operating Systems for ARM Cortex M Microcontrollers",
;   ISBN: 978-1466468863, Jonathan Valvano, copyright (c) 2013
;
;******************************************************************************
;
; <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
;
;******************************************************************************
Stack   EQU     0x00000400

;******************************************************************************
;
; <o> Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
;
;******************************************************************************
Heap    EQU     0x00000000

;******************************************************************************
;
; Allocate space for the stack.
;
;******************************************************************************
        AREA    STACK, READWRITE, ALIGN=3
StackMem
        SPACE   Stack

__initial_sp

;******************************************************************************
;
; Allocate space for the heap.
;
;******************************************************************************
        AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
HeapMem
        SPACE   Heap
__heap_limit

;******************************************************************************
;
; Indicate that the code in this file preserves 8-byte alignment of the stack.
;
;******************************************************************************
        PRESERVE8

;******************************************************************************
;
; Place code into the reset code section.
;
;******************************************************************************
        AREA    RESET, CODE, READONLY
        THUMB

;******************************************************************************
;
; The vector table.
;
;******************************************************************************
        EXPORT  __Vectors
__Vectors
        DCD     StackMem + Stack            ; Top of Stack
        DCD     Reset_Handler               ; Reset Handler
        DCD     NMI_Handler                 ; NMI Handler
        DCD     HardFault_Handler           ; Hard Fault Handler
        DCD     MemManage_Handler           ; MPU Fault Handler
        DCD     BusFault_Handler            ; Bus Fault Handler
        DCD     UsageFault_Handler          ; Usage Fault Handler
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     SVC_Handler                 ; SVCall Handler
        DCD     DebugMon_Handler            ; Debug Monitor Handler
        DCD     0                           ; Reserved
        DCD     PendSV_Handler              ; PendSV Handler
        DCD     SysTick_Handler             ; SysTick Handler
        DCD     GPIOPortA_Handler           ; GPIO Port A
        DCD     GPIOPortB_Handler           ; GPIO Port B
        DCD     GPIOPortC_Handler           ; GPIO Port C
        DCD     GPIOPortD_Handler           ; GPIO Port D
        DCD     GPIOPortE_Handler           ; GPIO Port E
        DCD     UART0_Handler               ; UART0 Rx and Tx
        DCD     UART1_Handler               ; UART1 Rx and Tx
        DCD     SSI0_Handler                ; SSI0 Rx and Tx
        DCD     I2C0_Handler                ; I2C0 Master and Slave
        DCD     PWM0Fault_Handler           ; PWM 0 Fault
        DCD     PWM0Generator0_Handler      ; PWM 0 Generator 0
        DCD     PWM0Generator1_Handler      ; PWM 0 Generator 1
        DCD     PWM0Generator2_Handler      ; PWM 0 Generator 2
        DCD     Quadrature0_Handler         ; Quadrature Encoder 0
        DCD     ADC0Seq0_Handler            ; ADC0 Sequence 0
        DCD     ADC0Seq1_Handler            ; ADC0 Sequence 1
        DCD     ADC0Seq2_Handler            ; ADC0 Sequence 2
        DCD     ADC0Seq3_Handler            ; ADC0 Sequence 3
        DCD     WDT_Handler                 ; Watchdog
        DCD     Timer0A_Handler             ; Timer 0 subtimer A
        DCD     Timer0B_Handler             ; Timer 0 subtimer B
        DCD     Timer1A_Handler             ; Timer 1 subtimer A
        DCD     Timer1B_Handler             ; Timer 1 subtimer B
        DCD     Timer2A_Handler             ; Timer 2 subtimer A
        DCD     Timer2B_Handler             ; Timer 2 subtimer B
        DCD     Comp0_Handler               ; Analog Comp 0
        DCD     Comp1_Handler               ; Analog Comp 1
        DCD     Comp2_Handler               ; Analog Comp 2
        DCD     SysCtl_Handler              ; System Control
        DCD     FlashCtl_Handler            ; Flash Control
        DCD     GPIOPortF_Handler           ; GPIO Port F
        DCD     GPIOPortG_Handler           ; GPIO Port G
        DCD     GPIOPortH_Handler           ; GPIO Port H
        DCD     UART2_Handler               ; UART2 Rx and Tx
        DCD     SSI1_Handler                ; SSI1 Rx and Tx
        DCD     Timer3A_Handler             ; Timer 3 subtimer A
        DCD     Timer3B_Handler             ; Timer 3 subtimer B
        DCD     I2C1_Handler                ; I2C1 Master and Slave
        DCD     Quadrature1_Handler         ; Quadrature Encoder 1
        DCD     CAN0_Handler                ; CAN0
        DCD     CAN1_Handler                ; CAN1
        DCD     CAN2_Handler                ; CAN2
        DCD     Ethernet_Handler            ; Ethernet
        DCD     Hibernate_Handler           ; Hibernate
        DCD     USB0_Handler                ; USB0
        DCD     PWM0Generator3_Handler      ; PWM 0 Generator 3
        DCD     uDMA_Handler                ; uDMA Software Transfer
        DCD     uDMA_Error                  ; uDMA Error
        DCD     ADC1Seq0_Handler            ; ADC1 Sequence 0
        DCD     ADC1Seq1_Handler            ; ADC1 Sequence 1
        DCD     ADC1Seq2_Handler            ; ADC1 Sequence 2
        DCD     ADC1Seq3_Handler            ; ADC1 Sequence 3
        DCD     I2S0_Handler                ; I2S0
        DCD     ExtBus_Handler              ; External Bus Interface 0
        DCD     GPIOPortJ_Handler           ; GPIO Port J
        DCD     GPIOPortK_Handler           ; GPIO Port K
        DCD     GPIOPortL_Handler           ; GPIO Port L
        DCD     SSI2_Handler                ; SSI2 Rx and Tx
        DCD     SSI3_Handler                ; SSI3 Rx and Tx
        DCD     UART3_Handler               ; UART3 Rx and Tx
        DCD     UART4_Handler               ; UART4 Rx and Tx
        DCD     UART5_Handler               ; UART5 Rx and Tx
        DCD     UART6_Handler               ; UART6 Rx and Tx
        DCD     UART7_Handler               ; UART7 Rx and Tx
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     I2C2_Handler                ; I2C2 Master and Slave
        DCD     I2C3_Handler                ; I2C3 Master and Slave
        DCD     Timer4A_Handler             ; Timer 4 subtimer A
        DCD     Timer4B_Handler             ; Timer 4 subtimer B
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     Timer5A_Handler             ; Timer 5 subtimer A
        DCD     Timer5B_Handler             ; Timer 5 subtimer B
        DCD     WideTimer0A_Handler         ; Wide Timer 0 subtimer A
        DCD     WideTimer0B_Handler         ; Wide Timer 0 subtimer B
        DCD     WideTimer1A_Handler         ; Wide Timer 1 subtimer A
        DCD     WideTimer1B_Handler         ; Wide Timer 1 subtimer B
        DCD     WideTimer2A_Handler         ; Wide Timer 2 subtimer A
        DCD     WideTimer2B_Handler         ; Wide Timer 2 subtimer B
        DCD     WideTimer3A_Handler         ; Wide Timer 3 subtimer A
        DCD     WideTimer3B_Handler         ; Wide Timer 3 subtimer B
        DCD     WideTimer4A_Handler         ; Wide Timer 4 subtimer A
        DCD     WideTimer4B_Handler         ; Wide Timer 4 subtimer B
        DCD     WideTimer5A_Handler         ; Wide Timer 5 subtimer A
        DCD     WideTimer5B_Handler         ; Wide Timer 5 subtimer B
        DCD     FPU_Handler                 ; FPU
        DCD     PECI0_Handler               ; PECI 0
        DCD     LPC0_Handler                ; LPC 0
        DCD     I2C4_Handler                ; I2C4 Master and Slave
        DCD     I2C5_Handler                ; I2C5 Master and Slave
        DCD     GPIOPortM_Handler           ; GPIO Port M
        DCD     GPIOPortN_Handler           ; GPIO Port N
        DCD     Quadrature2_Handler         ; Quadrature Encoder 2
        DCD     Fan0_Handler                ; Fan 0
        DCD     0                           ; Reserved
        DCD     GPIOPortP_Handler           ; GPIO Port P (Summary or P0)
        DCD     GPIOPortP1_Handler          ; GPIO Port P1
        DCD     GPIOPortP2_Handler          ; GPIO Port P2
        DCD     GPIOPortP3_Handler          ; GPIO Port P3
        DCD     GPIOPortP4_Handler          ; GPIO Port P4
        DCD     GPIOPortP5_Handler          ; GPIO Port P5
        DCD     GPIOPortP6_Handler          ; GPIO Port P6
        DCD     GPIOPortP7_Handler          ; GPIO Port P7
        DCD     GPIOPortQ_Handler           ; GPIO Port Q (Summary or Q0)
        DCD     GPIOPortQ1_Handler          ; GPIO Port Q1
        DCD     GPIOPortQ2_Handler          ; GPIO Port Q2
        DCD     GPIOPortQ3_Handler          ; GPIO Port Q3
        DCD     GPIOPortQ4_Handler          ; GPIO Port Q4
        DCD     GPIOPortQ5_Handler          ; GPIO Port Q5
        DCD     GPIOPortQ6_Handler          ; GPIO Port Q6
        DCD     GPIOPortQ7_Handler          ; GPIO Port Q7
        DCD     GPIOPortR_Handler           ; GPIO Port R
        DCD     GPIOPortS_Handler           ; GPIO Port S
        DCD     PWM1Generator0_Handler      ; PWM 1 Generator 0
        DCD     PWM1Generator1_Handler      ; PWM 1 Generator 1
        DCD     PWM1Generator2_Handler      ; PWM 1 Generator 2
        DCD     PWM1Generator3_Handler      ; PWM 1 Generator 3
        DCD     PWM1Fault_Handler           ; PWM 1 Fault

;******************************************************************************
;
; This is the code that gets called when the processor first starts execution
; following a reset event.
;
;******************************************************************************
        EXPORT  Reset_Handler
Reset_Handler
        ;
        ; DO NOT enable the floating-point unit.  This must be done here to handle the
        ; case where main() uses floating-point and the function prologue saves
        ; floating-point registers (which will fault if floating-point is not
        ; enabled).  Any configuration of the floating-point unit using
        ; DriverLib APIs must be done here prior to the floating-point unit
        ; being enabled.
        ;
        ; Note that this does not use DriverLib since it might not be included
        ; in this project.
        ;
;        MOVW    R0, #0xED88
;        MOVT    R0, #0xE000
;        LDR     R1, [R0]
;        ORR     R1, #0x00F00000
;        STR     R1, [R0]

        ;
        ; Call the C library enty point that handles startup.  This will copy
        ; the .data section initializers from flash to SRAM and zero fill the
        ; .bss section.
        ;
        IMPORT  __main
        B       __main

;******************************************************************************
;
; This is the code that gets called when the processor receives a NMI.  This
; simply enters an infinite loop, preserving the system state for examination
; by a debugger.
;
;******************************************************************************
NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP

;******************************************************************************
;
; This is the code that gets called when the processor receives a fault
; interrupt.  This simply enters an infinite loop, preserving the system state
; for examination by a debugger.
;
;******************************************************************************
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP

MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP


				IMPORT NokiaClear
				IMPORT	ClearMap
				IMPORT	PrintMap
				IMPORT	PrintCursor
				IMPORT	READ_POT1
				IMPORT	READ_POT2
				IMPORT	SetCursor_X
				IMPORT	SetCursor_Y	
				IMPORT		PrintCursorShip
				IMPORT		PrintShip
				IMPORT		PrintShip2
				IMPORT		PrintShip3
				IMPORT		PrintShip4
					IMPORT		PrintWarShip
				IMPORT		PrintWarShip2
				IMPORT		PrintWarShip3
				IMPORT		PrintWarShip4
				IMPORT		DELAY100
				IMPORT	INIT_COUNTER
				IMPORT	 PrintCursor2	
				IMPORT	 PrintMine1	
					IMPORT	 PrintMine2	
						IMPORT	 PrintMine3	
							IMPORT	 PrintMine4
							IMPORT	 DRAW_LOSE
							IMPORT	 DRAW_WIN	
								IMPORT	 MINE_CHECK	
;GPIO_PORTF_DATA		EQU 0x40025010 ; Access BIT2
LOW					EQU	0xf; Theoretically:0x00000014
HIGH				EQU	0xf; Theoretically:0x0000001E
TIMER0_ICR			EQU 0x40030024 ; Timer Interrupt Clear
	
PFdata 					EQU 0x400253FC 				; Port F Data address
SHIP1X	EQU 0x20000400	
SHIP1Y	EQU 0x20000404
SHIP2X	EQU 0x20000408	
SHIP2Y	EQU 0x2000040C
SHIP3X	EQU 0x20000410	
SHIP3Y	EQU 0x20000414
SHIP4X	EQU 0x20000418	
SHIP4Y	EQU 0x2000041C
CIVILNUMBER	EQU 0x20000440		
finalcheck	EQU	0x20000470	
MINENUMBER	EQU	0x20000480	
SysTick_Handler PROC
                EXPORT  SysTick_Handler           [WEAK]
				PUSH{LR}
				
				
			
PRESS0     		CMP R7, #0		;NO BUTTON IS PRESSED
				BNE	PRESS1
				BL ClearMap
				BL PrintCursorShip
				B	SKIP


PRESS1			CMP R7, #1		;FIRST BUTTON IS PRESSED
				BNE	PRESS2	
				BL ClearMap
				BL PrintCursorShip
				
				CMP R9, #1
				BLEQ PrintShip
				CMP R9, #2
				BLEQ	PrintWarShip
			;	BL PrintCursorShip
				B	SKIP
				
					
PRESS2			CMP R7, #2		;SECOND BUTTON IS PRESSED
				BNE	PRESS3
				BL ClearMap
				BL PrintCursorShip
				
				CMP R9, #1
				BLEQ PrintShip
				CMP R9, #2
				BLEQ	PrintWarShip
				
				CMP R10, #1
				BLEQ PrintShip2
				CMP R10, #2
				BLEQ	PrintWarShip2
			;	BL PrintCursorShip
				B	SKIP
				
PRESS3			CMP R7, #3		;THIRD BUTTON IS PRESSED
				BNE	PRESS4
				BL ClearMap
				BL PrintCursorShip
				CMP R9, #1
				BLEQ PrintShip
				CMP R9, #2
				BLEQ	PrintWarShip
				
				CMP R10, #1
				BLEQ PrintShip2
				CMP R10, #2
				BLEQ	PrintWarShip2
				
				CMP R11, #1
				BLEQ PrintShip3
				CMP R11, #2
				BLEQ	PrintWarShip3				
				B	SKIP
				
PRESS4			CMP R7, #4			;FOURTH BUTTON IS PRESSED
				BNE	PRESS5
				BL ClearMap
			;	BL PrintCursorShip
				CMP R9, #1
				BLEQ PrintShip
				CMP R9, #2
				BLEQ	PrintWarShip
				
				CMP R10, #1
				BLEQ PrintShip2
				CMP R10, #2
				BLEQ	PrintWarShip2
				
				CMP R11, #1
				BLEQ PrintShip3
				CMP R11, #2
				BLEQ	PrintWarShip3		

				CMP R12, #1
				BLEQ PrintShip4
				CMP R12, #2
				BLEQ	PrintWarShip4	
				B	SKIP
			
PRESS5			CMP R7, #5			;FIFTH BUTTON IS PRESSED
				BNE	PRESS6
				BL NokiaClear
				B	SKIP
				
PRESS6			CMP R7, #6			;SIXTH BUTTON IS PRESSED
				BNE	PRESS6_2		;EVENT OF 0.5 SECOND 
				BL PrintMap
				CMP R9, #1
				BLEQ PrintShip
				CMP R9, #2
				BLEQ	PrintWarShip
				
				CMP R10, #1
				BLEQ PrintShip2
				CMP R10, #2
				BLEQ	PrintWarShip2
				
				CMP R11, #1
				BLEQ PrintShip3
				CMP R11, #2
				BLEQ	PrintWarShip3		

				CMP R12, #1
				BLEQ PrintShip4
				CMP R12, #2
				BLEQ	PrintWarShip4
				ADD R7,#1
				B	SKIP
				
				
				


PRESS6_2		CMP R7, #7			;TEMPORARY CASE 
				BEQ	SKIP
				BNE PRESS6_3
				BL PrintMap	
				BL ClearMap
				BL PrintCursor2		
				B	SKIP
	

PRESS6_3		CMP R7, #8		;ATTACK PHASE
				BNE	PRESS7
				BL PrintMap	
				BL ClearMap
				BL PrintCursor2	
				B	SKIP
				
PRESS7			CMP R7, #9			;FIRST MINE IS PLACED
				BNE	PRESS8
				BL PrintMap	
				BL ClearMap
				BL PrintCursor2	
				BL PrintMine1
				LDR R0,=MINENUMBER
				MOV R1,#1
				STR R1,[R0]
			;	MOV R6,#1
				B	SKIP
PRESS8			CMP R7, #10			;SECOND MINE IS PLACED
				BNE	PRESS9
				BL PrintMap	
				BL ClearMap
				BL PrintMine2
				BL PrintMine1
				BL PrintCursor2	
				LDR R0,=MINENUMBER
				MOV R1,#2
				STR R1,[R0]
			;	MOV R6,#2		
				B	SKIP	
				
PRESS9			CMP R7, #11			;THIRD MINE IS PLACED
				BNE	PRESS10
				BL PrintMap	
				BL ClearMap
				BL PrintMine2
				BL PrintMine1
				BL PrintMine3
				BL PrintCursor2	
				LDR R0,=MINENUMBER
				MOV R1,#3
				STR R1,[R0]
			;	MOV R6,#3				
				B	SKIP
											
PRESS10			CMP R7, #12			;FOURTH MINE IS PLACED
				BNE	FINAL
				BL PrintMap	
				BL ClearMap
				BL PrintMine2
				BL PrintMine1
				BL PrintMine3
				BL PrintMine4
				BL PrintCursor2	
			;	MOV R6,#4
				LDR R0,=MINENUMBER
				MOV R1,#4
				STR R1,[R0]
				B	SKIP									
				
FINAL			CMP R7, #0xFF			;MINE AND SHIP DETECTION
				BNE	SKIP
				LDR R0,=MINENUMBER
				LDR R6,[R0]
				BL MINE_CHECK
				
				LDR	R3,=finalcheck
				LDR	R4,[R3]

				CMP	R4,#1
				BNE lose
				BL	DRAW_WIN
				B	SKIP
lose			BL	DRAW_LOSE
				B   SKIP
				
SKIP			POP{LR}
                BX LR
				ENDP
IntDefaultHandler\
                PROC

                EXPORT  GPIOPortA_Handler         [WEAK]
                EXPORT  GPIOPortB_Handler         [WEAK]
                EXPORT  GPIOPortC_Handler         [WEAK]
                EXPORT  GPIOPortD_Handler         [WEAK]
                EXPORT  GPIOPortE_Handler         [WEAK]
                EXPORT  UART0_Handler             [WEAK]
                EXPORT  UART1_Handler             [WEAK]
                EXPORT  SSI0_Handler              [WEAK]
                EXPORT  I2C0_Handler              [WEAK]
                EXPORT  PWM0Fault_Handler         [WEAK]
                EXPORT  PWM0Generator0_Handler    [WEAK]
                EXPORT  PWM0Generator1_Handler    [WEAK]
                EXPORT  PWM0Generator2_Handler    [WEAK]
                EXPORT  Quadrature0_Handler       [WEAK]
                EXPORT  ADC0Seq0_Handler          [WEAK]
                EXPORT  ADC0Seq1_Handler          [WEAK]
                EXPORT  ADC0Seq2_Handler          [WEAK]
                EXPORT  ADC0Seq3_Handler          [WEAK]
                EXPORT  WDT_Handler               [WEAK]
                EXPORT  Timer0A_Handler           [WEAK]
                EXPORT  Timer0B_Handler           [WEAK]
                EXPORT  Timer1A_Handler           [WEAK]
                EXPORT  Timer1B_Handler           [WEAK]
                EXPORT  Timer2A_Handler           [WEAK]
                EXPORT  Timer2B_Handler           [WEAK]
                EXPORT  Comp0_Handler             [WEAK]
                EXPORT  Comp1_Handler             [WEAK]
                EXPORT  Comp2_Handler             [WEAK]
                EXPORT  SysCtl_Handler            [WEAK]
                EXPORT  FlashCtl_Handler          [WEAK]
                EXPORT  GPIOPortF_Handler         [WEAK]
                EXPORT  GPIOPortG_Handler         [WEAK]
                EXPORT  GPIOPortH_Handler         [WEAK]
                EXPORT  UART2_Handler             [WEAK]
                EXPORT  SSI1_Handler              [WEAK]
                EXPORT  Timer3A_Handler           [WEAK]
                EXPORT  Timer3B_Handler           [WEAK]
                EXPORT  I2C1_Handler              [WEAK]
                EXPORT  Quadrature1_Handler       [WEAK]
                EXPORT  CAN0_Handler              [WEAK]
                EXPORT  CAN1_Handler              [WEAK]
                EXPORT  CAN2_Handler              [WEAK]
                EXPORT  Ethernet_Handler          [WEAK]
                EXPORT  Hibernate_Handler         [WEAK]
                EXPORT  USB0_Handler              [WEAK]
                EXPORT  PWM0Generator3_Handler    [WEAK]
                EXPORT  uDMA_Handler              [WEAK]
                EXPORT  uDMA_Error                [WEAK]
                EXPORT  ADC1Seq0_Handler          [WEAK]
                EXPORT  ADC1Seq1_Handler          [WEAK]
                EXPORT  ADC1Seq2_Handler          [WEAK]
                EXPORT  ADC1Seq3_Handler          [WEAK]
                EXPORT  I2S0_Handler              [WEAK]
                EXPORT  ExtBus_Handler            [WEAK]
                EXPORT  GPIOPortJ_Handler         [WEAK]
                EXPORT  GPIOPortK_Handler         [WEAK]
                EXPORT  GPIOPortL_Handler         [WEAK]
                EXPORT  SSI2_Handler              [WEAK]
                EXPORT  SSI3_Handler              [WEAK]
                EXPORT  UART3_Handler             [WEAK]
                EXPORT  UART4_Handler             [WEAK]
                EXPORT  UART5_Handler             [WEAK]
                EXPORT  UART6_Handler             [WEAK]
                EXPORT  UART7_Handler             [WEAK]
                EXPORT  I2C2_Handler              [WEAK]
                EXPORT  I2C3_Handler              [WEAK]
                EXPORT  Timer4A_Handler           [WEAK]
                EXPORT  Timer4B_Handler           [WEAK]
                EXPORT  Timer5A_Handler           [WEAK]
                EXPORT  Timer5B_Handler           [WEAK]
                EXPORT  WideTimer0A_Handler       [WEAK]
                EXPORT  WideTimer0B_Handler       [WEAK]
                EXPORT  WideTimer1A_Handler       [WEAK]
                EXPORT  WideTimer1B_Handler       [WEAK]
                EXPORT  WideTimer2A_Handler       [WEAK]
                EXPORT  WideTimer2B_Handler       [WEAK]
                EXPORT  WideTimer3A_Handler       [WEAK]
                EXPORT  WideTimer3B_Handler       [WEAK]
                EXPORT  WideTimer4A_Handler       [WEAK]
                EXPORT  WideTimer4B_Handler       [WEAK]
                EXPORT  WideTimer5A_Handler       [WEAK]
                EXPORT  WideTimer5B_Handler       [WEAK]
                EXPORT  FPU_Handler               [WEAK]
                EXPORT  PECI0_Handler             [WEAK]
                EXPORT  LPC0_Handler              [WEAK]
                EXPORT  I2C4_Handler              [WEAK]
                EXPORT  I2C5_Handler              [WEAK]
                EXPORT  GPIOPortM_Handler         [WEAK]
                EXPORT  GPIOPortN_Handler         [WEAK]
                EXPORT  Quadrature2_Handler       [WEAK]
                EXPORT  Fan0_Handler              [WEAK]
                EXPORT  GPIOPortP_Handler         [WEAK]
                EXPORT  GPIOPortP1_Handler        [WEAK]
                EXPORT  GPIOPortP2_Handler        [WEAK]
                EXPORT  GPIOPortP3_Handler        [WEAK]
                EXPORT  GPIOPortP4_Handler        [WEAK]
                EXPORT  GPIOPortP5_Handler        [WEAK]
                EXPORT  GPIOPortP6_Handler        [WEAK]
                EXPORT  GPIOPortP7_Handler        [WEAK]
                EXPORT  GPIOPortQ_Handler         [WEAK]
                EXPORT  GPIOPortQ1_Handler        [WEAK]
                EXPORT  GPIOPortQ2_Handler        [WEAK]
                EXPORT  GPIOPortQ3_Handler        [WEAK]
                EXPORT  GPIOPortQ4_Handler        [WEAK]
                EXPORT  GPIOPortQ5_Handler        [WEAK]
                EXPORT  GPIOPortQ6_Handler        [WEAK]
                EXPORT  GPIOPortQ7_Handler        [WEAK]
                EXPORT  GPIOPortR_Handler         [WEAK]
                EXPORT  GPIOPortS_Handler         [WEAK]
                EXPORT  PWM1Generator0_Handler    [WEAK]
                EXPORT  PWM1Generator1_Handler    [WEAK]
                EXPORT  PWM1Generator2_Handler    [WEAK]
                EXPORT  PWM1Generator3_Handler    [WEAK]
                EXPORT  PWM1Fault_Handler         [WEAK]

GPIOPortA_Handler
GPIOPortB_Handler
GPIOPortC_Handler
GPIOPortD_Handler
GPIOPortE_Handler
UART0_Handler
UART1_Handler
SSI0_Handler
I2C0_Handler
PWM0Fault_Handler
PWM0Generator0_Handler
PWM0Generator1_Handler
PWM0Generator2_Handler
Quadrature0_Handler
ADC0Seq0_Handler
ADC0Seq1_Handler
ADC0Seq2_Handler
ADC0Seq3_Handler
WDT_Handler
Timer0A_Handler
Timer0B_Handler
Timer1A_Handler
Timer1B_Handler
Timer2A_Handler
Timer2B_Handler
Comp0_Handler
Comp1_Handler
Comp2_Handler
SysCtl_Handler
FlashCtl_Handler
GPIOPortF_Handler
GPIOPortG_Handler
GPIOPortH_Handler
UART2_Handler
SSI1_Handler
Timer3A_Handler
Timer3B_Handler
I2C1_Handler
Quadrature1_Handler
CAN0_Handler
CAN1_Handler
CAN2_Handler
Ethernet_Handler
Hibernate_Handler
USB0_Handler
PWM0Generator3_Handler
uDMA_Handler
uDMA_Error
ADC1Seq0_Handler
ADC1Seq1_Handler
ADC1Seq2_Handler
ADC1Seq3_Handler
I2S0_Handler
ExtBus_Handler
GPIOPortJ_Handler
GPIOPortK_Handler
GPIOPortL_Handler
SSI2_Handler
SSI3_Handler
UART3_Handler
UART4_Handler
UART5_Handler
UART6_Handler
UART7_Handler
I2C2_Handler
I2C3_Handler
Timer4A_Handler
Timer4B_Handler
Timer5A_Handler
Timer5B_Handler
WideTimer0A_Handler
WideTimer0B_Handler
WideTimer1A_Handler
WideTimer1B_Handler
WideTimer2A_Handler
WideTimer2B_Handler
WideTimer3A_Handler
WideTimer3B_Handler
WideTimer4A_Handler
WideTimer4B_Handler
WideTimer5A_Handler
WideTimer5B_Handler
FPU_Handler
PECI0_Handler
LPC0_Handler
I2C4_Handler
I2C5_Handler
GPIOPortM_Handler
GPIOPortN_Handler
Quadrature2_Handler
Fan0_Handler
GPIOPortP_Handler
GPIOPortP1_Handler
GPIOPortP2_Handler
GPIOPortP3_Handler
GPIOPortP4_Handler
GPIOPortP5_Handler
GPIOPortP6_Handler
GPIOPortP7_Handler
GPIOPortQ_Handler
GPIOPortQ1_Handler
GPIOPortQ2_Handler
GPIOPortQ3_Handler
GPIOPortQ4_Handler
GPIOPortQ5_Handler
GPIOPortQ6_Handler
GPIOPortQ7_Handler
GPIOPortR_Handler
GPIOPortS_Handler
PWM1Generator0_Handler
PWM1Generator1_Handler
PWM1Generator2_Handler
PWM1Generator3_Handler
PWM1Fault_Handler
				EXTERN  My_Timer0A_Handler	
				B 		My_Timer0A_Handler
                B       .

                ENDP
			
;******************************************************************************
;
; Make sure the end of this section is aligned.
;
;******************************************************************************
        ALIGN

;******************************************************************************
;
; Some code in the normal code section for initializing the heap and stack.
;
;******************************************************************************
        AREA    |.text|, CODE, READONLY
			
			
;******************************************************************************
;
; Useful functions.
;
;******************************************************************************
        EXPORT  DisableInterrupts
        EXPORT  EnableInterrupts
        EXPORT  StartCritical
        EXPORT  EndCritical
        EXPORT  WaitForInterrupt

;*********** DisableInterrupts ***************
; disable interrupts
; inputs:  none
; outputs: none
DisableInterrupts
        CPSID  I
        BX     LR

;*********** EnableInterrupts ***************
; disable interrupts
; inputs:  none
; outputs: none
EnableInterrupts
        CPSIE  I
        BX     LR

;*********** StartCritical ************************
; make a copy of previous I bit, disable interrupts
; inputs:  none
; outputs: previous I bit
StartCritical
        MRS    R0, PRIMASK  ; save old status
        CPSID  I            ; mask all (except faults)
        BX     LR

;*********** EndCritical ************************
; using the copy of previous I bit, restore I bit to previous value
; inputs:  previous I bit
; outputs: none
EndCritical
        MSR    PRIMASK, R0
        BX     LR

;*********** WaitForInterrupt ************************
; go to low power mode while waiting for the next interrupt
; inputs:  none
; outputs: none
WaitForInterrupt
        WFI
        BX     LR

;******************************************************************************
;
; The function expected of the C library startup code for defining the stack
; and heap memory locations.  For the C library version of the startup code,
; provide this function so that the C library initialization code can find out
; the location of the stack and heap.
;
;******************************************************************************
    IF :DEF: __MICROLIB
        EXPORT  __initial_sp
        EXPORT  __heap_base
        EXPORT  __heap_limit
    ELSE
        IMPORT  __use_two_region_memory
        EXPORT  __user_initial_stackheap
__user_initial_stackheap
        LDR     R0, =HeapMem
        LDR     R1, =(StackMem + Stack)
        LDR     R2, =(HeapMem + Heap)
        LDR     R3, =StackMem
        BX      LR
    ENDIF

;******************************************************************************
;
; Make sure the end of this section is aligned.
;
;******************************************************************************
        ALIGN

;******************************************************************************
;
; Tell the assembler that we're done.
;
;******************************************************************************
        END
