#include "printf.h"
#include "../drivers/vga.h"

static uint32_t cursor_x = 0;
static uint32_t cursor_y = 0;

static void putc(char c) {
    if(c == '\n') {
        cursor_x = 0;
        cursor_y++;
        return;
    }
    put_char(c, 0x07, cursor_x, cursor_y);
    cursor_x++;
    if(cursor_x >= 80) {
        cursor_x = 0;
        cursor_y++;
    }
}

static void print_string(const char* str) {
    while(*str) putc(*str++);
}

void printf(const char* format, ...) {
    va_list args;
    va_start(args, format);

    for(const char* p = format; *p; p++) {
        if(*p == '%') {
            p++;
            if(*p == 'c') putc((char)va_arg(args, int));
            else if(*p == 's') print_string(va_arg(args, char*));
            else putc('%');
        } else {
            putc(*p);
        }
    }
    va_end(args);
}
