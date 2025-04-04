#include "../include/Helpers.hpp"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfo.h"

using namespace llvm;

namespace TaintAnalysis {

    void Helpers::printDebugInfo(Instruction *Inst) {
        if (DILocation *Loc = Inst->getDebugLoc()) {
            unsigned Line = Loc->getLine();
            StringRef File = Loc->getFilename();
            errs() << Colors::GREEN << "  at " << File << ":" << Line << Colors::RESET << "\n";
        } else {
            errs() << Colors::GREEN << "  at [Unknown Location]" << Colors::RESET << "\n";
        }
    }
    // bool Helpers::isMemset(CallInst *CI) {
    //     return true;
    // }
}
