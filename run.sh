#!/bin/bash

build/semu/semu -k semu/Image -c 1 -b build/semu/minimal.dtb -i build/initramfs.cpio
