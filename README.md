# iNix Operating System



iNix is a hobbyist i386 operating system written from scratch in \*\*assembly\*\* and \*\*bare-metal C\*\*, built with \*\*GRUB\*\*, \*\*QEMU\*\*, and a completely custom kernel.



This project is focused on:

- understanding low-level x86 architecture  

- building a minimal but complete OS kernel  

- implementing hardware drivers manually  

- writing a clean and educational codebase  



---



## 🚀 Features (so far)



- Multiboot-compliant GRUB bootloader  

- 32-bit protected mode kernel  

- VGA text-mode driver  

- Basic printf implementation  

- Kernel entry in pure assembly  

- Bootable ISO generation  

- Keyboard + interrupt system (in progress)



---



## 📂 Project Structure



```

iNix/

├── boot/               # Multiboot header + entry point

├── src/                # Kernel C code \& drivers

│     ├── drivers/      # Hardware drivers (VGA, keyboard, etc.)

│     ├── stdlib/       # Bare-metal C standard library

│     └── asm\_helpers/  # Assembly helpers (I/O, stubs)

├── include/            # Global headers

├── grub/               # GRUB boot configuration

├── linker.ld           # Linker script

├── build.bat           # Build script for Windows

├── clean.bat           # Clean script

└── aio.bat             # Clean + build + run

```



---



## 🧱 Build Requirements (Windows-only)



- **i686-elf-gcc toolchain**  

- **NASM**  

- **QEMU (i386)**  

- **WSL (only used for grub-mkrescue)**  

- `wsl grub-mkrescue` command available  



---



## 🔧 Build Instructions



### Manual:

`
build.bat
`



### Clean:

`
clean.bat
`



### Build + Clean + Run:

`
AIO.bat
`



---



## 🎮 Run in QEMU



`
qemu-system-i386 -cdrom iNix.iso
`



---



## 🧭 Roadmap



- [x] VGA text mode driver  

- [x] Kernel entry  

- [x] Basic printf  

- [ ] Interrupt descriptor table (IDT)  

- [ ] Keyboard IRQ driver  

- [ ] Memory management  

- [ ] Shell  

- [ ] Filesystem  



---



## 📜 License



This project is licensed under the MIT License.



---



## 🤝 Contributions



This project is primarily educational, but PRs and suggestions are welcome!



