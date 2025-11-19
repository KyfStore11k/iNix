#ifndef VGA_H
#define VGA_H

#include <stdint.h>

void clear_screen(void);
void put_char(char c, uint8_t color, uint32_t x, uint32_t y);

#endif
