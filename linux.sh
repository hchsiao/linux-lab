#!/bin/bash

mkdir -p build
cd build

if [ ! -f "linux-6.1.tar.gz" ]; then
  wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-6.1.tar.gz
  tar -xf linux-6.1.tar.gz
fi

cd linux-6.1
make O=o mrproper
export ARCH=um
export SUBARCH=x86_64
make O=o defconfig
make O=o -j $(expr $(nproc) / 2)
make O=o scripts_gdb
