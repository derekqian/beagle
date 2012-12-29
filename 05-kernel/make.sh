#!/bin/bash

# http://balau82.wordpress.com/2010/03/22/compiling-linux-kernel-for-qemu-arm-emulator/
#########################
# You could do the following:
# - Recompile the kernel with debugging symbols (the configuration should be in “kernel hacking” section inside the kernel menuconfig). enable the “compile with debug info” configuration that is present in the “make … menuconfig” screen in section “kernel hacking”.
# - Launch QEMU with debugging enabled (“-s -S” to launch it stopped and waiting for GDB)
# - Launch GDB with something like this (If you have ddd installed and your toolchain comes with gdb):
# $ ddd --debugger arm-unknown-linux-uclibcgnueabi-gdb -- vmlinux
# - Inside GDB:
# (gdb) target remote localhost:1234
# (gdb) b start_kernel
# (gdb) c
# - Try to debug step-by-step the kernel and understand what’s doing nasty things.
########################

rootfs=1

PATH=../arm-2011.03/bin:qemu/arm-softmmu:$PATH
#qemu-system-arm -M versatilepb -serial stdio -kernel test.bin # "Ctrl + a" and "x" to exit
#qemu-system-arm -M versatilepb -m 128M -serial stdio -kernel flash.bin # "Ctrl + a" and "x" to exit

if [ "$rootfs" != "1" ] ; then
qemu-system-arm -M versatilepb -m 128M -kernel kernel/arch/arm/boot/zImage
else
#qemu-system-arm -M versatilepb -m 128M -kernel kernel/arch/arm/boot/zImage -initrd rootfs -append "root=/dev/ram rdinit=/test"
#qemu-system-arm -M versatilepb -m 128M -serial stdio -kernel kernel/arch/arm/boot/zImage -initrd rootfs -append "root=/dev/ram rdinit=/test"
#qemu-system-arm -M versatilepb -m 128M -serial stdio -kernel kernel/arch/arm/boot/zImage -initrd rootfs -append "console=ttyAMA0 root=/dev/ram rdinit=/test"
qemu-system-arm -M versatilepb -m 128M -nographic -kernel kernel/arch/arm/boot/zImage -initrd rootfs -append "console=ttyAMA0 root=/dev/ram rdinit=/test"

fi

