#!/bin/bash

# http://balau82.wordpress.com/2010/03/22/compiling-linux-kernel-for-qemu-arm-emulator/

rootfs=1

PATH=../arm-2011.03/bin:qemu/arm-softmmu:$PATH
#qemu-system-arm -M versatilepb -serial stdio -kernel test.bin # "Ctrl + a" and "x" to exit
#qemu-system-arm -M versatilepb -m 128M -serial stdio -kernel flash.bin # "Ctrl + a" and "x" to exit

if [ "$rootfs" != "1" ] ; then
qemu-system-arm -M versatilepb -m 128M -kernel kernel/arch/arm/boot/zImage
else
qemu-system-arm -M versatilepb -m 128M -nographic -kernel kernel/arch/arm/boot/zImage -initrd rootfs.img.gz -append "console=ttyAMA0 root=/dev/ram rdinit=/bin/sh"
fi

