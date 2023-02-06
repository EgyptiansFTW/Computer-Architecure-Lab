 program to find the gcf of two numbers
X 			EQU 2
Y 			EQU 4

			EXPORT __main
 constant variables, directives, etc.
			AREA lab1, CODE, READONLY
			ENTRY
SRAM_BASE	EQU		0x20000000
N			DCD		10


__main		PROC
	
			mov r0, #X ; put x in register r0
			mov r1, #Y ; put y in register r1
loop
			cmp r1, r0 ; compare r2 with x
			blt swap ; if r2 is greater than x, branch to .end
			sub r0, r1, r0 ; add y to r2
			b finish ; branch to the beginning of the loop
swap		
			mov r2, r0 ; put x in register r2
			mov r0, r1 ; move r1 to r0
			mov r1, r2 ; move r2 to r1
			b loop ; branch to the beginning of the loop
finish
 end of program
task2
			mov r0,#0
			mul r0,r0,r0
			mov r1,#SRAM_BASE
			str r0, [r1], #4
			
			mov r0, #1
			mul r0,r0,r0
			str r0,[r1],#4
			
			mov r0, #2
			mul r0,r0,r0
			str r0,[r1],#4
			
			mov r0, #3
			mul r0,r0,r0
			str r0,[r1],#4
			
			mov r0, #4
			mul r0,r0,r0
			str r0,[r1],#4
			
			mov r0, #5
			mul r0,r0,r0
			str r0,[r1],#4
			
			mov r0, #6
			mul r0,r0,r0
			str r0,[r1],#4
			
			mov r0, #7
			mul r0,r0,r0
			str r0,[r1],#4
			
			mov r0, #8
			mul r0,r0,r0
			str r0,[r1],#4
			
			mov r0, #9
			mul r0,r0,r0
			str r0,[r1],#4
task3
			mov r0, #1
			mov r1, #2
			add r0, r1,r0 ;1+2
			
			add r1, #1
			add r0, r0,r1 ;+3
			
			add r1, #1
			add r0, r0,r1 ;+4
			
			add r1, #1
			add r0, r0,r1 ;+5
			
			add r1, #1
			add r0, r0,r1 ;+6
			
			add r1, #1
			add r0, r0,r1 ;+7
			
			add r1, #1
			add r0, r0,r1 ;+8
			
			add r1, #1
			add r0, r0,r1 ;+9
			
			add r1, #1
			add r0, r0,r1 ;+10
			mov r2, #SRAM_BASE
			str r0, [r2]
			
			

EXIT 		B EXIT
			END