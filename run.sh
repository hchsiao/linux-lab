#!/bin/bash

sed "s|\[\[HOME\]\]|$PWD|" gdbinit.template > build/gdbinit
cd build/linux*/o
ln -s ../../gdbinit .
gdb -x gdbinit

