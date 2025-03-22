[BITS 16]
[org 0x3000]

section .data
    printText equ 0x2000

section .text
    global _start

_start:
    mov ax, 0x2000
    mov ds, ax
    mov si, 0

    mov ah, 0x0E

loop_start:
    mov al, [si]
    cmp al, 0
    je loop_end

    mov bh, 0
    mov bl, 7
    int 0x10

    inc si
    jmp loop_start

loop_end:
    jmp 0x1000
