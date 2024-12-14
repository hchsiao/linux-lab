#!/bin/bash

FVP_BIN=$1
if [ -z $FVP_BIN ] || [ ! -f $FVP_BIN ]; then
  echo "FVP binary not found"
  exit 1
fi
$FVP_BIN \
  -C cache_state_modelled=0 \
  -C bp.refcounter.non_arch_start_at_default=1 \
  -C bp.secure_memory=false \
  -C cluster0.NUM_CORES=1 \
  -C cluster1.NUM_CORES=0 \
  build/boot-wrapper-aarch64/linux-system.axf
