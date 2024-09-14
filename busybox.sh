#!/bin/bash

mkdir -p build
cd build

if [ ! -f "busybox-1.36.1.tar.bz2" ]; then
  wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
  tar -xf busybox-1.36.1.tar.bz2
fi
cd busybox-1.36.1
mkdir -p o
make O=o ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
cp ../../busybox.config o/.config
make O=o ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j $(expr $(nproc) / 2)
make O=o ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- install CONFIG_PREFIX=rootfs
