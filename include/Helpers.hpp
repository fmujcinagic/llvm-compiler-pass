#ifndef HELPERS_HPP
#define HELPERS_HPP

#include "llvm/IR/Instruction.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include <string>

namespace TaintAnalysis {
    class Helpers {
        public:
            static void printDebugInfo(llvm::Instruction *Inst);
            static bool isMemset(llvm::CallInst *CI);
            // static bool isSizeMismatch(llvm::CallInst *CI, llvm::DenseMap<llvm::Value*, std::vector<std::pair<Value*, int>>> struct_map);
    };
}
namespace Colors {
    static const std::string RED = "\033[1;31m";
    static const std::string GREEN = "\033[1;32m";
    static const std::string RESET = "\033[0m";
    static const std::string YELLOW = "\033[1;33m";
}

#endif 
