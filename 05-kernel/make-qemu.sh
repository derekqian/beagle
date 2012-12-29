#!/bin/bash

# ./configure --target-list=arm-linux-user
#./configure --disable-kvm --target-list=arm-softmmu
./configure --target-list=arm-softmmu
make clean
make
