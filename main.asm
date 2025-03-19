[bits 16]
[org 0x1000]        

section .data
    message db 'Welcome To StanleyOS! Press a key.', 0

section .text
    global _start

_start:

    ; Set up the address for the VGA text buffer
    mov di, 0xB800  ; 16-bit address for the VGA buffer
    mov bx, 2000     ; Number of characters to clear (2000 characters on screen)
    mov si, message  ; Address of the message string

clear_screen: 
    ; Clear each character on the screen
    mov byte [di], 0x20     ; Write a space character
    mov byte [di + 1], 0x07 ; Set the color (light gray text on black background)

    add di, 2   ; Move to the next character slot
    dec bx      ; Decrease counter
    jnz clear_screen  ; Continue until 2000 characters are cleared

print_loop:
    mov al, [si]  ; Load the next character from the message
    cmp al, 0     ; Check for the null terminator
    je key_press  ; Jump to key press handling if we reach the end of the message

    mov [di], al  ; Write the character to the VGA buffer
    add di, 2     ; Move to the next character slot
    mov byte [di-1], 0x07  ; Set the color (light gray on black background)

    inc si        ; Move to the next character in the message
    jmp print_loop  ; Repeat for the next character

key_press:
    ; Wait for a key press
    mov ah, 0x00  ; BIOS function to get key press
    int 0x16      ; Call BIOS interrupt 0x16 to read key

    ; Print the key pressed
    mov ah, 0x0E  ; BIOS function to print character
    int 0x10      ; Call BIOS interrupt 0x10 to print the character

    jmp _start    ; Restart the process after key press

halt:
    jmp halt      ; Infinite loop to halt the program (not used)
