;Constants
MAGIC    equ  0x1BADB002
FLAGS    equ  0x00000001; Ask the bootloader to page align our modules
CHECKSUM equ -(MAGIC + FLAGS) 

section .multiboot
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM

section .bss
align 16
stack_bottom: ; Not needed now but could be useful in future
resb 16384
stack_top:

section .text
global _start:function (_start.end - _start)
_start:
    mov esp, stack_top ; Point the stack pointer to the top of the stack (stacks move upwards)
    cli
.hang:
    hlt
    jmp .hang
.end:
