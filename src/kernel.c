#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

uint16_t* terminal_buffer = (uint16_t*) 0xB8000;

uint16_t vga_entry(unsigned char c, uint8_t color) {
	return (uint16_t) c | (uint16_t) color << 8;
}
void kernel_main(void) {
    terminal_buffer[1] = vga_entry('H', 15);
    terminal_buffer[2] = vga_entry('e', 9);
    terminal_buffer[3] = vga_entry('l', 10);
    terminal_buffer[4] = vga_entry('l', 11);
    terminal_buffer[5] = vga_entry('o', 12);
    terminal_buffer[6] = vga_entry(' ', 13);
    terminal_buffer[7] = vga_entry('w', 14);
    terminal_buffer[8] = vga_entry('o', 15);
    terminal_buffer[9] = vga_entry('r', 7);
    terminal_buffer[10] = vga_entry('l', 5);
    terminal_buffer[11] = vga_entry('d', 1);
    terminal_buffer[12] = vga_entry('!', 2);
}