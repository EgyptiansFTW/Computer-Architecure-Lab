; program to find the maximum of three numbers
		EXPORT __main
; constant variables, directives, etc.
		AREA lab1, CODE, READONLY
ENTRY
NUMBERS 	DCD 0x6, 0x10, 0x25 ; defining numbers
SRAM_BASE 	EQU 0x20000000
hundred		EQU	0x0;
array   DCD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
        DCD 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
        DCD 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
        DCD 31, 32, 33, 34, 35, 36, 37, 38, 39, 40
        DCD 41, 42, 43, 44, 45, 46, 47, 48, 49, 50
        DCD 51, 52, 53, 54, 55, 56, 57, 58, 59, 60
        DCD 61, 62, 63, 64, 65, 66, 67, 68, 69, 70
        DCD 71, 72, 73, 74, 75, 76, 77, 78, 79, 80
        DCD 81, 82, 83, 84, 85, 86, 87, 88, 89, 90
        DCD 91, 92, 93, 94, 95, 96, 97, 98, 99, 10000

; code (FLASH) segment
__main	PROC
;		ADR r0, NUMBERS ; loads the address of the first number to a register r0
;		LDR r4, = SRAM_BASE ; loads the base address of the SRAM to register r4
;		LDM r0, {r1-r3}; loads the first number to register r1
;		CMP r1, r2 ; if first >= second
;		BGE CMP1
;CMP2 	CMP r2, r3 ; if first < second and second >= third
;		BGE FOUND2 ; r2 is the maximum
;		B FOUND3 ; (if first < second and second < third), r3 is the maximum
;CMP1 	CMP r1, r3 ; if first >= second and first >= third
;		BGE FOUND1 ; r1 is the maximum
;		B CMP2
;FOUND1 
;		STR r1, [r4] ; r1 is the maximum
;		B EXIT
;FOUND2 
;		STR r2, [r4] ; r2 is the maximum
;		B EXIT
;FOUND3 
;		STR r3, [r4] ; r3 is the maximum
;		B EXIT
;task2
;		LDR r2, =hundred;
;		MOV r3, #100;
;		LDR r4, =SRAM_BASE
;		
;loop	
;		LDR r5,[r2],#4
;		CMP r5,r0
;		MOVLT r0,r5
;		CMP R5,R1
;		MOVGT r1,r5
;		SUBS r3,#1
;		BNE loop
;		str r0,[r4]
;		str r1,[r4,#4]

;TASK 3		
		MOV R0, #100
		ADR R4, array
		ldr r5, =SRAM_BASE
		MOV R2, #1
RAND		
		ldr r1,[r4], #4  
		CMP r1,r2
		MOVLT r2,r1
		CMP R1,R3
		MOVGT r3,r1
		SUBS R0, #1
		BNE RAND
		
		SUB r6, r3,r2
		MOV r0, #2
		udiv r6, r0
		add r6, r6,r2
		mov r0, #100
		ADR R4, array

insert 
		ldr r1, [r4], #4
		cmp r1, r6
		bgt num
		str r1,[r5],#4
		SUBS r0, #1
		BNE insert
num 
		str r6, [r5], #4
fin 		
		str r1, [r5], #4
		ldr r1, [r4], #4
		SUBS r0, #1
		BNE fin
EXIT 	B EXIT
		END