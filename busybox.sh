#!/bin/bash

mkdir -p build
cd build
#export PATH="$(pwd)/riscv/bin:$PATH"
export PATH="$(pwd)/../semu/buildroot/output/host/bin:$PATH"

if [ ! -f "busybox-1.36.1.tar.bz2" ]; then
  wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
  tar -xf busybox-1.36.1.tar.bz2
fi
cd busybox-1.36.1
mkdir -p o
export CROSS_COMPILE=riscv32-buildroot-linux-gnu-
export ARCH=riscv
make O=o defconfig
cp ../../busybox.config o/.config
make O=o -j $(expr $(nproc) / 2)
make O=o install CONFIG_PREFIX=rootfs
