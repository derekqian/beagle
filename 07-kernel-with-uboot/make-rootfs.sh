#!/bin/bash

advanced=1

export PATH=~/beagle/arm-2008q3/bin:~/beagle/05-kernel/u-boot/tools:$PATH
cd busybox/_install
if [ "$advanced" = "1" ] ; then
mkdir proc sys dev etc etc/init.d
echo "#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
/sbin/mdev -s
" > etc/init.d/rcS
chmod +x etc/init.d/rcS
fi
find . | cpio -o --format newc > ../../rootfs.img
cd ../..
file rootfs.img
cpio -t < rootfs.img
gzip -c rootfs.img > rootfs.img.gz
