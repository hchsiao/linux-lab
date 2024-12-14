#!/bin/bash

mkdir -p build
cd build

if [ ! -f "linux-6.11-rc7.tar.gz" ]; then
  wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-6.11-rc7.tar.gz
  tar -xf linux-6.11-rc7.tar.gz
fi
cd linux-6.11-rc7
make O=o ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
cp ../../linux.config o/.config
make O=o ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j $(expr $(nproc) / 2)
make O=o ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image dtbs
