define hook-stop
    # Translate the segment:offset into a physical address
    printf "[%4x:%4x] ", $cs, $eip
    x/i $cs*16+$eip
end

# Use Intel syntax
set disassembly-flavor intel

# Set it to 16-bit mode for bootloader debugging
set architecture i8086

# Inspection of instructions and registers
layout asm
layout reg

# Configured QEMU port for GDB
target remote localhost:26000

# Break where the bootloader starts
b *0x7c00

# Break where the OS starts
b *0x7e00
