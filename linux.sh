#!/bin/bash

mkdir -p build
cd build
export PATH="$(pwd)/riscv32-buildroot-linux-gnu/bin:$PATH"

if [ ! -f "linux-6.1.tar.gz" ]; then
  wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-6.1.tar.gz
  tar -xf linux-6.1.tar.gz
fi
if [ ! -d "semu" ]; then
  git clone https://github.com/sysprog21/semu.git
  pushd semu
  git reset --hard a0ad61bc98fc22959f566240a81805f1733b8551
  popd
fi

cd linux-6.1
export CROSS_COMPILE=riscv32-buildroot-linux-gnu-
export ARCH=riscv
make O=o defconfig
cp ../semu/configs/linux.config o/.config
make O=o -j $(expr $(nproc) / 2)
