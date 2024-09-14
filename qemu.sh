#!/bin/bash

mkdir -p build
cd build

if [ ! -f "qemu-9.1.0.tar.xz" ]; then
  wget https://download.qemu.org/qemu-9.1.0.tar.xz
  tar xvJf qemu-9.1.0.tar.xz
fi
cd qemu-9.1.0
#./configure --target-list=avr-softmmu --enable-debug --prefix=$(pwd)/o
./configure --target-list=aarch64-softmmu --enable-debug --prefix=$(pwd)/o
make -j $(expr $(nproc) / 2)
make install
