[BITS 16]
[org 0x4000]

mov ah, 0x03
mov al, bl
mov ch, cl
mov cl, dl
mov dh, bh
mov dl, ah

xor bx, bx
xor cx, cx
xor dx, dx
xor si, si
xor di, di


jmp 0x1000