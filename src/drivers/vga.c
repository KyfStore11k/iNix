#include "vga.h"

volatile uint16_t* VGA_MEMORY = (volatile uint16_t*)0xB8000;
#define VGA_WIDTH 80
#define VGA_HEIGHT 25

void clear_screen(void) {
    for(int y = 0; y < VGA_HEIGHT; y++) {
        for(int x = 0; x < VGA_WIDTH; x++) {
            VGA_MEMORY[y * VGA_WIDTH + x] = (0x07 << 8) | ' ';
        }
    }
}

void put_char(char c, uint8_t color, uint32_t x, uint32_t y) {
    VGA_MEMORY[y * VGA_WIDTH + x] = (color << 8) | c;
}
