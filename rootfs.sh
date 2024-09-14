#!/bin/bash

mkdir -p build
cd build

fallocate -l 64MiB rootfs.img
mkfs.ext4 rootfs.img

mkdir -p rootfs
sudo mount -o loop ./rootfs.img ./rootfs
sudo mkdir rootfs/{dev,proc,sys}

sudo cp -a busybox-1.36.1/o/rootfs/bin rootfs/bin
sudo cp -a busybox-1.36.1/o/rootfs/sbin rootfs/sbin
sudo cp -a busybox-1.36.1/o/rootfs/usr rootfs/usr
sudo cp -a busybox-1.36.1/o/rootfs/linuxrc rootfs/linuxrc

# Optional
sudo mkdir -p rootfs/etc/init.d
sudo touch rootfs/etc/init.d/rcS
sudo chmod +x rootfs/etc/init.d/rcS

sudo chown -R root:root rootfs/*
sudo umount rootfs
