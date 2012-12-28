#!/bin/bash

PATH=../arm-2011.03/bin:PATH
arm-none-linux-gnueabi-gcc --version
arm-none-linux-gnueabi-gcc -c -mcpu=cortex-a8 -nostdlib -g test.c -o test.o
arm-none-linux-gnueabi-as -mcpu=cortex-a8 -g startup.s -o startup.o
arm-none-linux-gnueabi-ld -T test.ld test.o startup.o -o test.elf
arm-none-linux-gnueabi-gdb test.elf
# (gdb) target sim # only work for arm-none-eabi-gdb
# (gdb) load
# (gdb) break c_entry
# (gdb) run
# (gdb) set $pc=0
# (gdb) stepi
ddd --debugger arm-none-linux-gnueabi-gdb test.elf
