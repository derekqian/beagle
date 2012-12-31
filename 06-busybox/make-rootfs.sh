#!/bin/bash

export PATH=~/beagle/arm-2008q3/bin:~/beagle/05-kernel/u-boot/tools:$PATH
cd busybox/_install
find . | cpio -o --format newc > ../../rootfs.img
cd ../..
file rootfs.img
cpio -t < rootfs.img
gzip -c rootfs.img > rootfs.img.gz
