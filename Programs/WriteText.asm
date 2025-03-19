[BITS 16]
[org 0x3000]

section .data
    printText db [0x2000], |

section .text
    global _start

_start:

    mov ah, 0x0E
loop_start:
    lea si, [printText]

    mov al, [si]

    cmp al, |
    je loop_end

    mov bh, 0
    mov bl, 7
    int 0x10

    inc si

    jmp loop_start

loop_end:

    jmp 0x1000





