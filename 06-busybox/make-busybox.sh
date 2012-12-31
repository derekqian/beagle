#!/bin/bash

export PATH=~/beagle/arm-2008q3/bin:~/beagle/05-kernel/u-boot/tools:$PATH
cd busybox
make defconfig ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
make menuconfig ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- # “Busybox Settings --> Build Options“ static
make install ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-

cd ..

