; program to drive red LED on
						EXPORT __main
SYSCTRL_BASE 			EQU 0x400FE000 ; system controller base address (p. 231)
SYSCTRL_RCGCGPIO_OFFSET EQU 0x608 ; GPIO run mode clock gating control offset register
GPIO_PORTF_BASE 		EQU 0x40025000 ; port F base address (p. 658)
GPIO_DIR_OFFSET 		EQU 0x400 ; direction offset
GPIO_GPIOPDR_OFFSET 	EQU 0x514 ; pull down select offset
GPIO_GPIODEN_OFFSET 	EQU 0x51C ; digital enable offset
GPIO_DATA_OFFSET 		EQU 0x8 ; page 654
						AREA lab4, CODE, READONLY
ENTRY
__main 					PROC
;task1
; enable clock on GPIO PORT F
						LDR r0, =SYSCTRL_BASE
						LDR r1, =SYSCTRL_RCGCGPIO_OFFSET
						MOV r2, #0x20
						STR r2, [r0, r1]
						
						; set GPIO PORTF Pin 1 (GPF1) to output
						LDR r0, =GPIO_PORTF_BASE
						LDR r1, =GPIO_DIR_OFFSET
						MOV r2, #0xE
						STR r2, [r0, r1]
						; selecting a pull-down resistor GPF1
						LDR r1, =GPIO_GPIOPDR_OFFSET
						STR r2, [r0, r1]
						; enable digital output for GPF1
						LDR r1, =GPIO_GPIODEN_OFFSET
						STR r2, [r0, r1]
						; turn on led at GPF1
;						MOV r2, #0xE
;						LDR r1, =GPIO_DATA_OFFSET
;						ORR r1, r2, LSL #2
;						STR r2, [r0, r1]
;task2 					
						; turn on led at GPF1
;ONN	
;						MOV r2, #0x2
;						LDR r1, =GPIO_DATA_OFFSET
;						ORR r1, r2, LSL #2
;						STR r2, [r0, r1]
;						BL DELAY

;OFFF
;						MOV r2, #0
;						ORR R1, R2, LSL #2
;						STR R2, [R0,R1]
;						BL DELAY
;						B ONN
;						
;DELAY 					LDR r4 ,=5000000
;WAIT 					
;						SUB r4, r4, #1
;						CMP r4, #0
;						BNE WAIT
;						mov pc, lr
;task 3
;RED	
;						MOV r2, #0x2
;						LDR r1, =GPIO_DATA_OFFSET
;						ORR r1, r2, LSL #2
;						STR r2, [r0, r1]
;						BL DELAY
;	
;GREEN	
;						MOV r2, #0x4
;						LDR r1, =GPIO_DATA_OFFSET
;						ORR r1, r2, LSL #2
;						STR r2, [r0, r1]
;						BL DELAY
;						
;BLUE	
;						MOV r2, #0x8
;						LDR r1, =GPIO_DATA_OFFSET
;						ORR r1, r2, LSL #2
;						STR r2, [r0, r1]
;						BL DELAY
;						B RED
;						
;DELAY 					LDR r4 ,=5000000
;WAIT 					
;						SUB r4, r4, #1
;						CMP r4, #0
;						BNE WAIT
;OFFF
;						MOV r2, #0
;						ORR R1, R2, LSL #2
;						STR R2, [R0,R1]
;						LDR r4 ,=5000000
;WAIT2 					
;						SUB r4, r4, #1
;						CMP r4, #0
;						BNE WAIT2
;						mov pc, lr
;task4
RG	
						MOV r2, #0x2
						LDR r1, =GPIO_DATA_OFFSET
						ORR r1, r2, LSL #2
						STR r2, [r0, r1]
						BL DELAY
						
						MOV r2, #0x4
						LDR r1, =GPIO_DATA_OFFSET
						ORR r1, r2, LSL #2
						STR r2, [r0, r1]
						BL DELAY
						
						MOV r2, #0x6
						LDR r1, =GPIO_DATA_OFFSET
						ORR r1, r2, LSL #2
						STR r2, [r0, r1]
						BL DELAY
						
						MOV r2, #0x8
						LDR r1, =GPIO_DATA_OFFSET
						ORR r1, r2, LSL #2
						STR r2, [r0, r1]
						BL DELAY
						
RB	
						MOV r2, #0xA
						LDR r1, =GPIO_DATA_OFFSET
						ORR r1, r2, LSL #2
						STR r2, [r0, r1]
						BL DELAY
						
						MOV r2, #0xC
						LDR r1, =GPIO_DATA_OFFSET
						ORR r1, r2, LSL #2
						STR r2, [r0, r1]
						BL DELAY
GB	
						MOV r2, #0xE
						LDR r1, =GPIO_DATA_OFFSET
						ORR r1, r2, LSL #2
						STR r2, [r0, r1]
						BL DELAY
						B RG
						
DELAY 					LDR r4 ,=5000000
WAIT 					
						SUB r4, r4, #1
						CMP r4, #0
						BNE WAIT
OFFF
						MOV r2, #0
						ORR R1, R2, LSL #2
						STR R2, [R0,R1]
						LDR r4 ,=5000000
WAIT2 					
						SUB r4, r4, #1
						CMP r4, #0
						BNE WAIT2
						mov pc, lr						
						
EXIT 					B EXIT
						ENDP
						END

