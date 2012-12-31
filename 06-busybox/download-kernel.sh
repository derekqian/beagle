#!/bin/bash

# http://www.kernel.org/pub/software/scm/git/docs/user-manual.html

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git kernel
git tag -l
git checkout v2.6.37
