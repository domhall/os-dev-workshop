;Constants
FLAGS    equ  0x00000001; Ask the bootloader to page align our modules
MAGIC    equ  0x1BADB002
CHECKSUM equ -(MAGIC + FLAGS) 

section .multiboot
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM

section .bss

section .text
global _start:function (_start.end - _start)
_start:
    cli
.hang:
    hlt
    jmp .hang
.end:
