; Assembly entry point - sets up stack and calls kmain
BITS 32
global start

extern kmain

start:
    cli                  ; clear interrupts
    mov esp, 0x90000     ; set stack
    call kmain
hang:
    hlt
    jmp hang
