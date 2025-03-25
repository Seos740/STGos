[bits 16]
[org 0x9000]   ; Load address set by bootloader

    cli              ; Disable interrupts
    cld              ; Clear direction flag

    call enable_a20  ; Enable A20 line
    lgdt [gdt_desc]  ; Load GDT
    mov eax, cr0     
    or eax, 1        ; Set PE bit in CR0
    mov cr0, eax

    jmp CODE_SEG:init_protected_mode  ; Far jump to 32-bit mode

enable_a20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

gdt_start:
    dq 0x0000000000000000   ; Null descriptor

gdt_code:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x9A
    db 0xCF
    db 0x00

gdt_data:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x92
    db 0xCF
    db 0x00

gdt_end:

gdt_desc:
    dw gdt_end - gdt_start - 1  ; GDT size
    dd gdt_start                ; GDT address

[bits 32]
init_protected_mode:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    mov esp, 0x90000  ; Set up stack

    jmp start_kernel  ; Jump to kernel

start_kernel:
    jmp 0x100000   ; Jump to kernel entry
    cli
    hlt  ; Halt CPU (replace with actual kernel)

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
