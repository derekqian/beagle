ENTRY(_Reset)
SECTIONS{
  . = 0x0;
  .text : {
    startup.o(INTERRUPT_VECTOR)
    *(.text)
  }
  .data : {*(.data)}
  .bss : {*(.bss COMMON)}
  . = ALIGN(8);
  . = . + 0x1000;
  stack_top = .;
}
