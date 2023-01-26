# About OS 01

This is a sample OS/bootloader for demonstration purpose only, adopted from the book "Operating_Systems_From_0_to_1".

## Prerequisites
* Unix based environment (Tested in Ubuntu 20.04 & 22.04)
* `gcc-multilib` for compiling in 32-bit mode
* [`nasm`](https://www.nasm.us/)
* [QEMU](https://www.qemu.org/)

## Build and Run
1. In this directory (where `Makefile` is present), run `make image` to build the OS's image file.
2. Run `make emu` to start the QEMU process running the OS image.
3. Start the GNU Debugger (GDB) and connect to the target by running `target remote localhost:26000`.
4. Before debugging, make sure to run `set architecture i8086` as well.
5. It is recommended to take advantage of the `.gdbinit` file by running GDB in the current directory to avoid typing init commands every time. It may require this file to be added to the default init file in the system. See GDB prompt for more information.
6. Run `make clean` to wipe the built artifacts.
