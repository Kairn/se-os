#!/usr/bin/make -f

SHELL=/bin/bash

SRC_DIR := ./src
OUT_DIR := ./build
OS_IMAGE_FILE := $(OUT_DIR)/os01.img
GDB_PORT := 26000

# Assembly files
ASM_SOURCES := $(shell find $(SRC_DIR) -name '*.asm')

.PHONY: all
all: image

# Start the emulator with the built image
.PHONY: emu
emu: image
	qemu-system-i386 -machine q35 -fda $(OS_IMAGE_FILE) -gdb tcp::$(GDB_PORT) -S

# Write the disk image
.PHONY: image
image: $(ASM_SOURCES:$(SRC_DIR)/%.asm=$(OUT_DIR)/%) $(OS_IMAGE_FILE)
	dd conv=notrunc if=$(OUT_DIR)/bootloader of=$(OS_IMAGE_FILE) bs=512 count=1 seek=0 # Bootloader
	dd conv=notrunc if=$(OUT_DIR)/sample of=$(OS_IMAGE_FILE) bs=512 count=1 seek=1 # Sample kernel

# Make a virtual floppy disk for writing OS image
$(OS_IMAGE_FILE):
	dd if=/dev/zero of=$@ bs=512 count=2880

# Assemble each .asm source file
$(OUT_DIR)/%: $(SRC_DIR)/%.asm
	@mkdir -p $(dir $@)
	nasm -f bin $< -o $@

.PHONY: clean
clean:
	@rm -rf $(OUT_DIR)
