; Multiboot header for GRUB
BITS 32
SECTION .multiboot_header
align 4
dd 0x1BADB002          ; magic number
dd 0x00000003          ; flags: align modules + memory info
dd -(0x1BADB002 + 0x3) ; checksum
