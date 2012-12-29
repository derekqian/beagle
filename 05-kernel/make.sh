#!/bin/bash

# http://balau82.wordpress.com/2010/03/22/compiling-linux-kernel-for-qemu-arm-emulator/

PATH=../arm-2011.03/bin:qemu/arm-softmmu:$PATH
#arm-none-linux-gnueabi-gcc -c -mcpu=arm926ej-s -nostdlib -g test.c -o test.o
#arm-none-linux-gnueabi-as -mcpu=arm926ej-s -g startup.s -o startup.o
#arm-none-linux-gnueabi-ld -T test.ld test.o startup.o -o test.elf
#arm-none-linux-gnueabi-objcopy -O binary test.elf test.bin

#qemu-system-arm -M versatilepb -serial stdio -kernel test.bin # "Ctrl + a" and "x" to exit
#qemu-system-arm -M versatilepb -m 128M -serial stdio -kernel flash.bin # "Ctrl + a" and "x" to exit
qemu-system-arm -M versatilepb -m 128M -kernel kernel/arch/arm/boot/zImage


