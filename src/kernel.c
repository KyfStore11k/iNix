#include "kmain.h"
#include "drivers/vga.h"
#include "stdlib/printf.h"

void kmain(void) {
    clear_screen();
    printf("Test Message Printed from iNix!\n");
    while(1) {
        asm volatile("hlt");
    }
}
