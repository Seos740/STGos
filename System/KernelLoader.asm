[BITS 32]
[org 0x100000]

write_text:
    pusha
    mov esi, string         ; Load string address
    mov edi, 0xB8000        ; Start of video memory

.loop:
    lodsb                   ; Load next byte from string into AL
    test al, al             ; Check if null terminator
    jz .done                ; If null, stop

    mov [edi], al           ; Store character
    mov byte [edi+1], 0x07  ; Store attribute (light gray on black)
    add edi, 2              ; Move to next character
    jmp .loop               ; Repeat

.done:
    popa
    ret

string db "Hello, StanleyOS!", 0