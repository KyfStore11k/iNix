@echo off
REM ==========================================
REM iNix OS Clean Script
REM ==========================================

REM Delete object and ELF files
if exist *.o del /Q *.o
if exist *.elf del /Q *.elf
if exist iNix.iso del /Q iNix.iso

REM Remove ISO folder
if exist iso rmdir /S /Q iso

echo Clean complete!
pause
