#!/bin/bash

# http://busybox.net/source.html

git clone git://busybox.net/busybox.git
git tag -l
git checkout remotes/origin/1_16_stable
