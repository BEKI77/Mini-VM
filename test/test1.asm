.ORIG x3000      ; Start address of the program

    LEA R0, PROMPT   ; Load address of prompt message
    PUTS             ; Display the prompt

    LEA R1, BUFFER   ; Load address of buffer to store input

INPUT_LOOP:
    GETC             ; Get character from keyboard
    STR R0, R1, #0   ; Store character in buffer
    ADD R2, R0, #-10 ; Check if ENTER key (ASCII 10)
    BRz PRINT_OUTPUT ; If ENTER, go to output
    ADD R1, R1, #1   ; Move to next buffer position
    BR INPUT_LOOP    ; Repeat input

PRINT_OUTPUT:
    LEA R0, NEWLINE  ; Load newline character
    PUTS             ; Print newline
    
    LEA R0, BUFFER   ; Load address of buffer
    PUTS             ; Print the stored input

    HALT             ; Stop execution

PROMPT .STRINGZ "Enter text: "  ; Prompt message
NEWLINE .STRINGZ "\n"           ; Newline string
BUFFER .BLKW 100                ; Reserve space for input

.END
