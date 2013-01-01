#!/bin/bash

# http://balau82.wordpress.com/2010/04/12/booting-linux-with-u-boot-on-qemu-arm/
# in u-boot: iminfo 0x410000

PATH=../arm-2011.03/bin:qemu/arm-softmmu:$PATH
#qemu-system-arm -M versatilepb -serial stdio -kernel test.bin # "Ctrl + a" and "x" to exit
#qemu-system-arm -M versatilepb -m 128M -serial stdio -kernel flash.bin # "Ctrl + a" and "x" to exit

u-boot/tools/mkimage -A arm -C none -O linux -T kernel -d kernel/arch/arm/boot/zImage -a 0x00010000 -e 0x00010000 zImage.uimg
u-boot/tools/mkimage -A arm -C none -O linux -T ramdisk -d rootfs.img.gz -a 0x00800000 -e 0x00800000 rootfs.uimg
dd if=/dev/zero of=flash.bin bs=1 count=6M
dd if=u-boot/u-boot.bin of=flash.bin conv=notrunc bs=1
dd if=zImage.uimg of=flash.bin conv=notrunc bs=1 seek=2M
dd if=rootfs.uimg of=flash.bin conv=notrunc bs=1 seek=4M
hexdump -C u-boot/u-boot.bin | head > u-boot.hex
hexdump -C flash.bin | head > flash.hex
diff u-boot.hex flash.hex && echo OK
hexdump -C zImage.uimg | head > zImage.hex
hexdump -s 0x200000 -C flash.bin | head > flash.hex
hexdump -C rootfs.uimg | head > rootfs.hex
hexdump -s 0x400000 -C flash.bin | head > flash.hex
qemu-system-arm -M versatilepb -m 128M -nographic -kernel flash.bin
#qemu-system-arm -M versatilepb -m 128M -nographic -kernel flash.bin -initrd rootfs.img.gz
#qemu-system-arm -M versatilepb -m 128M -nographic -kernel kernel/arch/arm/boot/zImage -initrd rootfs.img.gz -append "console=ttyAMA0 root=/dev/ram mem=128M rdinit=/sbin/init"


