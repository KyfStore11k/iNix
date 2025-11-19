@echo off
REM ==========================================
REM iNix OS All-In-One Script with QEMU GDB Stub
REM ==========================================

echo ==========================================
echo Cleaning previous build...
echo ==========================================
cmd /c "clean.bat <nul"

echo ==========================================
echo Building iNix ISO...
echo ==========================================
cmd /c "build.bat <nul"

echo ==========================================
echo Running QEMU with GDB stub...
echo ==========================================
REM -s opens GDB stub on TCP port 1234
REM -S freezes CPU until debugger attaches
REM -m 512M sets 512MB RAM, -vga std gives a standard VGA window
qemu-system-i386 -cdrom iNix.iso -s -S -m 512M -vga std

echo ==========================================
echo QEMU exited.
echo ==========================================
echo Cleaning again...
cmd /c "clean.bat <nul"

pause