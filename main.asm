[bits 16]
[org 0x1000]        

section .data
    message db 'Welcome To StanleyOS! Press a key.', 0

section .text
    global _start

_start:
    mov bx, 0x3000
    mov [0x1000], bx
    mov dx, Test
    mov [0x2000], dx
    mov di, 0xB8000  
    mov bx, 2000     

clear_screen: 
    mov word [di], 0x0720 
    add di, 2
    dec bx
    jnz clear_screen  

    mov di, 0xB8000  
    mov si, message  

print_loop:
    mov al, [si]  
    cmp al, 0     
    je key_press  

    mov [di], al  
    mov byte [di+1], 0x07  

    add di, 2  
    inc si        
    jmp print_loop  

    
