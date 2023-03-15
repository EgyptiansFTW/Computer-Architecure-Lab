		EXPORT __main
; ARM Assembly program to add two matrices and store the sum in SRAM

; Matrix A (4x3)
; ARM Assembly program to add two matrices and store the sum in SRAM

; Matrix A (4x3)
		AREA data, DATA,READONLY
MATRIX_A
    DCW 1, 2, 3
    DCW 2, 2, 3
    DCW 1, 3, 3
    DCW 4, 2, 4

; Matrix B (4x3)
MATRIX_B
    DCW -1, 2, 3
    DCW 2, -2, 4
    DCW 3, -1, 3
    DCW 5, -4, 1
; Matrix C (3x2)
MATRIX_C
    DCW 5, -1
    DCW 3, 1
    DCW -2, 6
	
; Constants task1
ROWS EQU 4
COLS EQU 3
MATRIX_SIZE EQU ROWS * COLS

; Constants task 2
;ROWS_A EQU 4
;COLS_A EQU 3
;ROWS_C EQU 3
;COLS_C EQU 2
;MATRIX_SIZE_A EQU ROWS_A * COLS_A
;MATRIX_SIZE_C EQU ROWS_C * COLS_C
; SRAM address to store the sum matrix
SRAM_BASE EQU 0x20000000
;SRAM_BASE EQU 0x20004000

        AREA lab6, CODE, READONLY
        ENTRY

__main PROC
;TASK1
        ; Initialize pointers to Matrix A, Matrix B, and the SRAM
        LDR R0, =MATRIX_A
        LDR R1, =MATRIX_B
        LDR R2, =SRAM_BASE

        ; Outer loop for rows
        MOV R3, #0
ROW_LOOP
        ; Inner loop for columns
        MOV R4, #0
COL_LOOP
        ; Load matrix elements and perform addition
        LDR R5, [R0]
        LDR R6, [R1]
        ADD R7, R5, R6

        ; Store the result in the sum matrix in SRAM
        STR R7, [R2]

        ; Increment pointers
        ADD R0, R0, #2 ; Move to the next element in Matrix A
        ADD R1, R1, #2 ; Move to the next element in Matrix B
        ADD R2, R2, #2 ; Move to the next element in the sum matrix

        ; Increment column index
        ADD R4, R4, #1
        CMP R4, #COLS
        BLT COL_LOOP

        ; Increment row index
        ADD R3, R3, #1
        CMP R3, #ROWS
        BLT ROW_LOOP

;TASK2
;	LDR R0, =MATRIX_A
;    LDR R1, =MATRIX_C
;    LDR R2, =SRAM_BASE

;    ; Outer loop for rows of A
;    MOV R3, #0
;ROW_LOOP
;    ; Middle loop for columns of C
;    MOV R4, #0
;COL_LOOP
;    ; Initialize the accumulator for the dot product
;    MOV R6, #COLS_C
;    LSL R6, R6, #1
;    SUB R1, R1, R6 ; Move back to the first element in Matrix C
;    MOV R9, #0

;    ; Inner loop for columns of A / rows of C
;    MOV R5, #0
;MULT
;    ; Load elements from Matrix A and Matrix C
;    ADD R6, R0, R5, LSL #1 ; Calculate the address of the element in Matrix A
;    LDR R7, [R6]           ; Load the element from Matrix A
;    ADD R6, R1, R5, LSL #1 ; Calculate the row address of the element in Matrix C
;    ADD R6, R6, R4, LSL #1 ; Calculate the column address of the element in Matrix C
;    LDR R8, [R6]           ; Load the element from Matrix C

;    ; Multiply and accumulate the elements
;    MUL R6, R7, R8
;    ADD R9, R9, R6

;    ; Increment the inner index
;    ADD R5, R5, #1
;    CMP R5, #COLS_A
;    BLT MULT

;    ; Store the result in the product matrix D in SRAM
;    STR R9, [R2]

;    ; Increment pointers
;    ADD R2, R2, #2 ; Move to the next element in the product matrix D
;    ADD R1, R1, #2 ; Move to the next element in Matrix C

;    ; Increment middle index
;    ADD R4, R4, #1
;    CMP R4, #COLS_C
;    BLT COL_LOOP

;    ; Increment outer index and reset middle index
;    MOV R6, #COLS_A
;    LSL R6, R6, #1
;    ADD R0, R0, R6 ; Move to the next row in Matrix A

;    MOV R4, #0                	; Reset middle index
;    ADD R3, R3, #1
;    CMP R3, #ROWS_A
;    BLT ROW_LOOP

    END
    B END

    ENDP
    END

