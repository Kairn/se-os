;******************************
; bootloader.asm
; A simple bootloader (Master Boot Record)
;******************************

org 0x7c00 ; Where BIOS jumps to when running the bootloader
bits 16
start: jmp boot

; Constants and variable definitions
msg db "Welcome to Eddy's edition of OS 01", 0ah, 0dh, 0h

boot:
    cli ; No interrupts (Clear Interrupt Flag)
    cld ; All we need to init (Clear Direction Flag)

    ; Loading the "sample" program from sector 2
    ; Set the buffer address where the sector will be loaded at (es:bx)
    xor bx, bx ; Clear bx (0x0)
    mov es, bx ; Code segment at 0x0
    mov ds, bx ; Make sure ds is set to 0
    mov bx, 0x7e00 ; 512 bytes from the first sector

    mov al, 2 ; Read 2 sectors
    mov ch, 0 ; Read track 0
    mov cl, 2 ; Read the second sector (1-17)
    mov dh, 0 ; Head number
    mov dl, 0 ; Drive number (0=A:, 1=2nd floppy, 80h:drive 0, 81h=drive 1)
    mov ah, 0x02 ; BIOS routine ID for reading sectors from disk
    int 0x13 ; Call the BIOS routine

    jmp 0x7e00 ; Jump to the loaded memory to execute the sector

    hlt ; Halt the system

; 512 bytes required. Clear the rest of the bytes with 0
times 510 - ($-$$) db 0 ; $ is current address, $$ refers to the beginning of the current section
dw 0xAA55 ; 2-byte ending boot signature for the boot sector
