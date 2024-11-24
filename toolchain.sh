#!/bin/bash

mkdir -p build
cd build

if [ ! -d "semu" ]; then
  git clone https://github.com/sysprog21/semu.git
  pushd semu
  git reset --hard a0ad61bc98fc22959f566240a81805f1733b8551
  popd
fi
if [ ! -d "buildroot" ]; then
  git clone https://github.com/buildroot/buildroot -b 2024.05.2 --depth=1
fi

cp -f semu/configs/buildroot.config buildroot/.config
cp -f semu/configs/busybox.config buildroot/busybox.config
# Otherwise, the error below raises:
#   You seem to have the current working directory in your
#   LD_LIBRARY_PATH environment variable. This doesn't work.
unset LD_LIBRARY_PATH
pushd buildroot
make olddefconfig
make
popd
cp -r buildroot/output/host/ riscv32-buildroot-linux-gnu
