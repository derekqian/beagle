#!/bin/bash

export PATH=../arm-2008q3/bin:$PATH
arm-none-linux-gnueabi-gcc --version
cd u-boot
make versatilepb_config ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
make all ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
cd ..

