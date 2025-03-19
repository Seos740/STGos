[BITS 16]
[org 0x2000]

section .text
    global _start

_start:

    mov bx, [0x1000]
    xor [0x1000]

    mov ax, 0B800
    mov es, ax

    clear:

    mov di, 0x0000
    mov cx, 2000

    mov word [es:di], 0x0720


    add di, 2
    loop clear


    jmp bx