#!/usr/bin/make -f

SHELL=/bin/bash

SRC_DIR := ./src
BUILD_DIR := ./build
BOOTLOADER := $(BUILD_DIR)/bootloader/bootloader.o
OS := $(BUILD_DIR)/os/sample.o
OS_IMAGE_FILE := $(BUILD_DIR)/os01.img
GDB_PORT := 26000

.PHONY: all
all: image

# Start the emulator with the built image
.PHONY: emu
emu: image
	qemu-system-i386 -machine q35 -fda $(OS_IMAGE_FILE) -gdb tcp::$(GDB_PORT) -S

# Write the disk image
.PHONY: image
image: bootloader os $(OS_IMAGE_FILE)
	dd conv=notrunc if=$(BOOTLOADER) of=$(OS_IMAGE_FILE) bs=512 count=1 seek=0 # Bootloader
	dd conv=notrunc if=$(OS) of=$(OS_IMAGE_FILE) bs=512 count=1 seek=1 # Sample kernel

# Make a virtual floppy disk for writing OS image
$(OS_IMAGE_FILE):
	dd if=/dev/zero of=$@ bs=512 count=2880

.PHONY: bootloader
bootloader:
	make -C $(SRC_DIR)/bootloader

.PHONY: os
os:
	make -C $(SRC_DIR)/os

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)
