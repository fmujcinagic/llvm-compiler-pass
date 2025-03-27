# LLVM-based Compiler Pass For Kernel Taint Tracking in Linux Kernel

**Prerequisites**
- LLVM Version 19
- Clang 19
- CMake (≥ 3.13)
- Make

**Set LLVM Environment Variable**

Bash/Zsh:

`export LLVM_DIR=/usr/lib/llvm-19`

Fish:

`set -Ux LLVM_DIR /usr/lib/llvm-19`

**Auto-run script usage:**

Put desired testcase written in C or `.ll` file that contains LLVM Intermediate Representation (LLVM IR) code in `testcases` folder. Then run:

`chmod +x auto_run.sh`

`./auto_run.sh testcases/vuln_simple.c`
