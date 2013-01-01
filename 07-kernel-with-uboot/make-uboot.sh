#!/bin/bash

export PATH=~/beagle/arm-2008q3/bin:$PATH
arm-none-linux-gnueabi-gcc --version
cd u-boot
patch -p1 < ../uboot.patch # patch file created by: git diff > uboot.patch
make versatilepb_config ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
make all ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
cd ..

