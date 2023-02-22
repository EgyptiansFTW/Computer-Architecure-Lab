		 EXPORT __main
		 AREA lab2, CODE, READONLY
			 
N	 	  DCD 10
SRAM_BASE DCD 0x20000000 ; read/write memory base address
	
		 ENTRY
__main	 PROC
;task1	
;		 MOV R0, #0 ; Initialize sum to 0
;		 MOV R1, #0 ; Initialize loop counter i to 0
;		 LDR R2, N ; load N
;loop
;		 CMP R1, R2 ; Check if i is equal to 10
;		 BEQ avg ; If i is equal to N, branch to End
;		 
;		 ADD R0, R0, R1 ; Add i to sum
;		 ADD R1, R1, #1 ; Increment i
;		 B loop ; Branch back to Loop

;avg
;		 add r0,r0,r1
;		 sdiv r0, r0, r2
;		 LDR R2, SRAM_BASE ; load the base address
;		 STR R0, [R2] ; store the sum to memory
;task2		
;		 MOV R0, #1 ; Initialize sum to 1
;		 MOV R1, #0 ; Initialize loop counter i to 0
;		 LDR R2, N ; load N
;loop
;		 CMP R1, R2 ; Check if i is equal to 10
;		 BEQ fac ; If i is equal to N, branch to End
;		 B mult ;  branch to mult
;		 
;		 
;mult
;		 ADD R1, R1, #1 ; Increment i
;		 MUL R0, R0, R1 ; mult i to sum

;		 B loop ; Branch back to Loop

;fac
;		 LDR R2, SRAM_BASE ; load the base address
;		 STR R0, [R2] ; store the factorial to memory		
;task3
		 MOV R0, #0 ; Initialize sum to 1
		 MOV R1, #1 ; Initialize loop counter i to 0
		 LDR R2, N

loop
		 ADD R0, R0,R1 ; Check if i is equal to 10
		 ADD R1, #1	
dec
		 SUB r2,r2,#1
		 CMP R2,#0
		 beq store
		 B loop

store
		 LDR R2, SRAM_BASE ; load the base address
		 STR R0, [R2] ; store the factorial to memory	 
exit	 B exit 
		END