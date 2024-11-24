#!/bin/bash

mkdir -p build
cd build

git clone https://github.com/sysprog21/semu.git
cd semu
ENABLE_VIRTIOBLK=0 ENABLE_VIRTIONET=0 make
