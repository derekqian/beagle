#!/bin/bash

export PATH=~/beagle/arm-2008q3/bin:~/beagle/05-kernel/u-boot/tools:$PATH
cd kernel
mkimage
make distclean ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
make versatile_defconfig ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
make menuconfig ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- # remove module, enable EABI
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- uImage -s
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- all
file arch/arm/boot/uImage
cd ..

