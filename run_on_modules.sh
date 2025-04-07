#!/bin/bash
set -e

LLVM_DIR="$HOME/Documents/thesis/llvm-project/build"  
KERNEL_SRC="../linux"
MODULE_NAME=$(basename "${1%.*}")
MODULE_DIR=$(dirname "$1")
OUTPUT_IR="/tmp/module.ll"

if [ -z "$1" ]; then
    echo "Usage: $0 <module.c|module.ko> [--in-tree]"
    exit 1
fi

SOURCE_FILE="$1"

mkdir -p build && cd build
cmake -DLLVM_DIR="$LLVM_DIR/lib/cmake/llvm" ..
make
cd ..

if [ "$2" == "--in-tree" ]; then
    echo "[+] IN-TREE MODULE: $SOURCE_FILE (requires CONFIG_DEBUG_INFO_BTF)"
    cd "$KERNEL_SRC"
    make LLVM=1 "$SOURCE_FILE"
    MODULE_KO="${SOURCE_FILE%.*}.ko"
    # "$LLVM_DIR/bin/llvm-objdump" --dump-section=llvmir="$OUTPUT_IR" "$MODULE_KO"
    "$LLVM_DIR/bin/clang" -emit-llvm -S -O0 -g -o "$OUTPUT_IR" "$SOURCE_FILE"

else
    echo "[+] CUSTOM MODULE: $SOURCE_FILE"
    KERNEL_HEADERS="/lib/modules/$(uname -r)/build"
    ARCH=$(uname -m | sed 's/x86_64/x86/')
    # There is more work to be done here, but this is for start --> when the kernel module is the custom one!!    
    "$LLVM_DIR/bin/clang" \
        -I"$KERNEL_HEADERS/include" \
        -I"$KERNEL_HEADERS/arch/$ARCH/include" \
        -I"$KERNEL_HEADERS/arch/$ARCH/include/generated" \
        -I"$KERNEL_HEADERS/arch/$ARCH/include/uapi" \
        -I"$KERNEL_HEADERS/arch/$ARCH/include/generated/uapi" \
        -I"$KERNEL_HEADERS/include/uapi" \
        -I"$KERNEL_HEADERS/include/generated/uapi" \
        -include "$KERNEL_HEADERS/include/linux/kconfig.h" \
        -include "$KERNEL_HEADERS/include/linux/compiler_types.h" \
        -D__KERNEL__ -DMODULE \
        -Qunused-arguments \
        -Wall -Wno-unused-variable \
        -Wno-duplicate-decl-specifier -Wno-frame-address -Wno-address-of-packed-member \
        -fno-strict-aliasing \
        -fno-common \
        -fshort-wchar \
        -fno-PIE \
        -std=gnu11 \
        -emit-llvm -S -O0 -g \
        -o "$OUTPUT_IR" \
        "$SOURCE_FILE"
        
    echo "[+] Generated LLVM IR at $OUTPUT_IR"
fi

"$LLVM_DIR/bin/opt" \
    -load-pass-plugin ./build/libTaintTracker.so \
    -passes=taint-tracker \
    -disable-output \
    "$OUTPUT_IR"