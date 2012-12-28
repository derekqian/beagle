#!/bin/bash

# http://balau82.wordpress.com/2010/03/10/u-boot-for-arm-on-qemu/

PATH=../arm-2011.03/bin:qemu/arm-softmmu:$PATH
arm-none-linux-gnueabi-gcc -c -mcpu=arm926ej-s -nostdlib -g test.c -o test.o
arm-none-linux-gnueabi-as -mcpu=arm926ej-s -g startup.s -o startup.o
arm-none-linux-gnueabi-ld -T test.ld test.o startup.o -o test.elf
arm-none-linux-gnueabi-objcopy -O binary test.elf test.bin
u-boot/tools/mkimage -A arm -C none -O linux -T kernel -d test.bin -a 0x00100000 -e 0x00100000 test.uimg
cat u-boot/u-boot.bin test.uimg > flash.bin
printf "iminfo 0x%X\n" $(expr $(stat -c%s u-boot/u-boot.bin) + 65536)
printf "bootm 0x%X\n" $(expr $(stat -c%s u-boot/u-boot.bin) + 65536)

#qemu-system-arm -M versatilepb -serial stdio -kernel test.bin # "Ctrl + a" and "x" to exit
qemu-system-arm -M versatilepb -m 128M -nographic -kernel flash.bin


