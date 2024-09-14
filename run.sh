#!/bin/bash

cd build/
qemu-9.1.0/o/bin/qemu-system-aarch64 \
  -M virt -cpu cortex-a53 -nographic -smp 1 \
  -kernel linux-6.11-rc7/o/arch/arm64/boot/Image \
  -append "rootwait root=/dev/vda console=ttyAMA0" \
  -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 \
  -drive file=rootfs.img,if=none,format=raw,id=hd0 \
  -device virtio-blk-device,drive=hd0
#qemu-5.2.0/o/bin/qemu-system-aarch64 \
#  -M virt -cpu cortex-a15 -nographic -smp 1 \
#  -kernel ~/buildroot/output/images/Image \
#  -dtb my.dtb \
#  -append "rw earlycon loglevel=8 rootwait root=/dev/vda console=ttyAMA0" \
#  -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 \
#  -drive file=$HOME/buildroot/output/images/rootfs.ext4,if=none,format=raw,id=hd0 \
#  -device virtio-blk-device,drive=hd0 \
#  -trace exec_tb
