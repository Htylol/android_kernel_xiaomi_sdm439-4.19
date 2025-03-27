#!/usr/bin/env bash
#rm -rf out
export CLANG_PATH=~/kernel/linux-x86-refs_heads_main-clang-r530567/bin
export PATH=${CLANG_PATH}:${PATH}
export THINLTO_CACHE=~/ltocache/
export ARCH=arm64
export SUBARCH=arm64
make LLVM=1 LLVM_IAS=1 CC="ccache clang" defconfig O=out
make -j$(nproc --all) O=out \
    CC="ccache clang" \
    CROSS_COMPILE=aarch64-linux-gnu- \
    CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
    CROSS_COMPILE_COMPAT=arm-linux-gnueabi- \
    LLVM=1 \
    LLVM_IAS=1
