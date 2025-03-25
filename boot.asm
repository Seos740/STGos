[bits 16]              ; We are working in 16-bit mode, which is what the BIOS expects.
[org 0x7C00]           ; The bootloader is loaded at memory address 0x7C00 by the BIOS.

start:
    ; Initialize stack
    cli                  ; Disable interrupts
    xor ax, ax           ; Clear AX register
    mov ss, ax           ; Set the stack segment to 0
    mov sp, 0x7C00       ; Set the stack pointer to the bottom of the loaded bootloader
    
    ; Jump to our program (the main logic)
    jmp 0x9000           ; Jump to the actual program logic, assuming it's located at 0x1000

; Fill the rest of the space up to 510 bytes with zeros (padding)
times 510 - ($ - $$) db 0   ; This will fill the remaining space with zero bytes

; The boot sector signature (required by the BIOS) at the last two bytes
dw 0xAA55                ; BIOS boot signature (required to indicate it's a bootable disk)

