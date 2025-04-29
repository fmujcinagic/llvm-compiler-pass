#include "../include/Helpers.hpp"
#include "../include/TaintTracker.hpp"
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

    bool Helpers::isMemset(CallInst *CI) {
        // note: This function is needed because otherwise e.g. char result1[200] = {}; is flagged as a sink
        if (!CI || !CI->getCalledFunction()) return false;
        if (CI->getCalledFunction()->getName().contains("memset")) {
            // errs() << "Checking memset call: " << *CI << "\n";
                if (auto* constant = dyn_cast<ConstantInt>(CI->getArgOperand(1))) {
                    if (constant->isZero()) {
                        return false;  // zero initialization is always safe
                    }
                }
                return true;
        }
        return false;
    }  
}
