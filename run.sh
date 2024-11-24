#!/bin/bash

build/semu/semu -k build/linux-6.1/o/arch/riscv/boot/Image -c 1 -b build/semu/minimal.dtb -i build/initramfs.cpio
