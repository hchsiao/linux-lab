#!/bin/bash

mkdir -p build
cd build

mkdir -p rootfs
fakeroot mkdir rootfs/{dev,proc,sys}

fakeroot cp -a busybox-1.36.1/o/rootfs/bin rootfs/bin
fakeroot cp -a busybox-1.36.1/o/rootfs/sbin rootfs/sbin
fakeroot cp -a busybox-1.36.1/o/rootfs/usr rootfs/usr
fakeroot cp -a busybox-1.36.1/o/rootfs/linuxrc rootfs/linuxrc

# Optional
fakeroot mkdir -p rootfs/etc/init.d
fakeroot touch rootfs/etc/init.d/rcS
fakeroot chmod +x rootfs/etc/init.d/rcS

fakeroot chown -R root:root rootfs/*
