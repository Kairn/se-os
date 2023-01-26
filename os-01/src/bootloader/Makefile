#!/usr/bin/make -f

SHELL=/bin/bash

BUILD_DIR := ../../build/bootloader
BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))

all: $(BOOTLOADER_OBJS)

# Assemble all bootloader files
$(BUILD_DIR)/%.o: %.asm
	@mkdir -p $(dir $@)
	nasm -f bin $< -o $@
