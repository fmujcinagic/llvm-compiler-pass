if [ -z "$1" ]; then
  echo "Usage: ./auto_run.sh <source.c>"
  exit 1
fi

SOURCE_FILE="$1"
BASE_NAME=$(basename "$SOURCE_FILE" .c)
LLVM_IR="testcases_ll/${BASE_NAME}.ll"
mkdir -p build && cd build
cmake -DLLVM_DIR="$LLVM_DIR/lib/cmake/llvm" ..
make
cd ..

"$LLVM_DIR/bin/clang" -g -O0 -emit-llvm -S "$SOURCE_FILE" -o "$LLVM_IR"

"$LLVM_DIR/bin/opt" -load-pass-plugin ./build/libTaintTracker.so -passes=taint-tracker -disable-output "$LLVM_IR"
