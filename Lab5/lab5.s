; ARM assembly program to toggle LED on GPF3 whenever SW1 (GPF0) is pressed without debouncing
            EXPORT __main

; System and GPIO constants
SYSCTRL_BASE EQU 0x400FE000 ; system controller base address (p. 231)
SYSCTRL_RCGCGPIO_OFFSET EQU 0x608 ; GPIO run mode clock gating control offset register
GPIO_PORTF_BASE EQU 0x40025000 ; port F base address (p. 658)
GPIO_DIR_OFFSET EQU 0x400 ; direction offset
GPIO_GPIOPUR_OFFSET EQU 0x510 ; pull up select offset
GPIO_GPIODEN_OFFSET EQU 0x51C ; digital enable offset

; Area and Entry point
            AREA lab5, CODE, READONLY
            ENTRY

__main       PROC
            ; Enable clock on GPIO PORT F
            LDR r0, =SYSCTRL_BASE
            LDR r1, =SYSCTRL_RCGCGPIO_OFFSET
            MOV r2, #0x20
            STR r2, [r0, r1]

            ; Set GPF0 as input and GPF3 as output
            LDR r0, =GPIO_PORTF_BASE
            LDR r1, =GPIO_DIR_OFFSET
            LDR r2, [r0, r1]
            BIC r2, r2, #0x1 ; GPF0 as input
            ORR r2, r2, #0x8 ; GPF3 as output
            STR r2, [r0, r1]

            ; Enable pull-up resistor for GPF0
            LDR r1, =GPIO_GPIOPUR_OFFSET
            MOV r2, #0x1
            STR r2, [r0, r1]

            ; Enable digital output for GPF0 and GPF3
            LDR r1, =GPIO_GPIODEN_OFFSET
            MOV r2, #0x9
            STR r2, [r0, r1]

        ; Main loop
LOOP
            ; Read GPF0
            LDR r1, [r0, #0x010] ; Read from GPF0
            ANDS r2, r1, #0x1

            ; If GPF0 is pressed (0), toggle the LED
            BEQ TOGGLE_LED
            B LOOP

TOGGLE_LED
            ; Read GPF3 state
            LDR r1, [r0, #0x020] ; Read from GPF3
            ANDS r2, r1, #0x8

            ; Toggle GPF3
            EOR r2, r2, #0x8
            STR r2, [r0, #0x020] ; Write to GPF3
            BL DELAY
            ; Wait for SW1 to be released
WAIT_RELEASE
            LDR r1, [r0, #0x010] ; Read from GPF0
            ANDS r2, r1, #0x1
            BEQ WAIT_RELEASE

            B LOOP
            ENDP
                ; Simple delay subroutine
DELAY
                PUSH {r4, lr} ; Save r4 and lr registers
                MOV r4, #0x00FFFFFF ; Set delay count
DELAY_LOOP
                SUBS r4, r4, #1
                BNE DELAY_LOOP
                POP {r4, lr} ; Restore r4 and lr registers
                BX lr ; Return to caller

				END
