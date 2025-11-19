@echo off
REM ==========================================
REM iNix OS Build Script (Windows + WSL)
REM ==========================================

REM Compile ASM files
nasm -f elf32 boot/multiboot_header.asm -o boot/multiboot_header.o
nasm -f elf32 boot/entry.asm -o boot/entry.o
nasm -f elf32 src/asm_helpers/io.asm -o src/asm_helpers/io.o
nasm -f elf32 src/asm_helpers/printf.asm -o src/asm_helpers/printf.o

REM Compile C files
i686-elf-gcc -m32 -ffreestanding -O2 -Iinclude -c src/kernel.c -o src/kernel.o
i686-elf-gcc -m32 -ffreestanding -O2 -Iinclude -c src/drivers/vga.c -o src/drivers/vga.o
i686-elf-gcc -m32 -ffreestanding -O2 -Iinclude -c src/stdlib/printf.c -o src/stdlib/printf.o
i686-elf-gcc -m32 -ffreestanding -O2 -Iinclude -c src/stdlib/string.c -o src/stdlib/string.o

REM Link ELF kernel (explicit order)
i686-elf-ld -m elf_i386 -T linker.ld boot/multiboot_header.o boot/entry.o src/kernel.o src/drivers/vga.o src/stdlib/printf.o src/stdlib/string.o src/asm_helpers/io.o src/asm_helpers/printf.o -o kernel.elf

REM Prepare ISO folder
if not exist iso mkdir iso
if not exist iso\boot mkdir iso\boot
if not exist iso\boot\grub mkdir iso\boot\grub

copy /Y kernel.elf iso\boot\kernel.elf
copy /Y grub\grub.cfg iso\boot\grub\grub.cfg

REM Build ISO using WSL GRUB
wsl -d Ubuntu grub-mkrescue -o iNix.iso iso

echo Build complete! ISO: iNix.iso
pause
