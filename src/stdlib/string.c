#include "string.h"

uint32_t strlen(const char* str) {
    uint32_t len = 0;
    while(str[len]) len++;
    return len;
}

char* strcpy(char* dest, const char* src) {
    char* d = dest;
    while((*d++ = *src++));
    return dest;
}
