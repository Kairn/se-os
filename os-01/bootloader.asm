;******************************
; bootloader.asm
; A simple Bootloader (Master Boot Record)
;******************************

org 0x7c00 ; Where BIOS jumps to when running the bootloader
bits 16
start: jmp boot

; Constants and variable definitions
msg db "Welcome to Eddy's edition of OS 01", 0ah, 0dh, 0h

boot:
    cli ; No interrupts (Clear Interrupt Flag)
    cld ; All we need to init (Clear Direction Flag)
    hlt ; Halt the system

; 512 bytes required. Clear the rest of the bytes with 0
times 510 - ($-$$) db 0 ; $ is current address, $$ refers to the beginning of the current section
dw 0xAA55 ; 2-byte ending boot signature for the boot sector
