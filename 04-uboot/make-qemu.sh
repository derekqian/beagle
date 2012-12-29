#!/bin/bash

git branch -a
git checkout stable-1.2
#./configure --disable-kvm --target-list=arm-softmmu
./configure --target-list=arm-softmmu
make clean
make
