#!/bin/bash

export PATH=~/beagle/arm-2008q3/bin:~/beagle/05-kernel/u-boot/tools:$PATH
arm-none-linux-gnueabi-gcc -static test.c -o test
file test
echo test | cpio -o --format newc > rootfs
file rootfs
cpio -t < rootfs
