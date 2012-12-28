#!/bin/bash

# http://balau82.wordpress.com/2012/04/15/arm926-interrupts-in-qemu/

PATH=../arm-2011.03/bin:qemu/arm-softmmu:PATH
arm-none-linux-gnueabi-gcc --version
arm-none-linux-gnueabi-gcc -c -mcpu=arm926ej-s -nostdlib -g test.c -o test.o
arm-none-linux-gnueabi-as -mcpu=arm926ej-s -g vectors.s -o vectors.o
arm-none-linux-gnueabi-ld -T test.ld test.o vectors.o -o test.elf
arm-none-linux-gnueabi-objcopy -O binary test.elf test.bin

qemu-system-arm -M versatilepb -serial stdio -kernel test.bin # "Ctrl + a" and "x" to exit


