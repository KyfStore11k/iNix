; Simple port I/O helper
global outb
global inb

outb:
    ; AL = value, DX = port
    out dx, al
    ret

inb:
    in al, dx
    ret
