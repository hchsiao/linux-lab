#!/bin/bash

mkdir -p build
cd build

if [ ! -d "semu" ]; then
  git clone https://github.com/sysprog21/semu.git
  pushd semu
  git reset --hard a0ad61bc98fc22959f566240a81805f1733b8551
  popd
fi

pushd semu
ENABLE_VIRTIOBLK=0 ENABLE_VIRTIONET=0 make
popd
