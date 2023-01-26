#!/usr/bin/make -f

SHELL=/bin/bash

BUILD_DIR := ../../build/os
OS_SRCS := $(wildcard *.asm)
OS_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(OS_SRCS))

all: $(OS_OBJS)

# Assemble all OS files
$(BUILD_DIR)/%.o: %.asm
	@mkdir -p $(dir $@)
	nasm -f bin $< -o $@
