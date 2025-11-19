ENTRY(start)

SECTIONS
{
    /* Multiboot header must be first in the ELF file */
    .multiboot_header :
    {
        KEEP(*(.multiboot_header))
    }

    /* Kernel proper is loaded at 1MB */
    . = 1M;

    .text : { *(.text) *(.rodata) }
    .data : { *(.data) }
    .bss  : { *(.bss COMMON) }
}
