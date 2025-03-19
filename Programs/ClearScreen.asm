[BITS 16]
[org 0x2000]

section .text
    global _start

_start:

    clear:

    mov di, 0xB800
    mov bx, 2000

    mov byte [di], 0x20
    mov byte [di + 1], 0x07

    add di, 2
    dec bx
    jnz clear

    jmp 0x1000