#ifndef TAINT_TRACKER_HPP
#define TAINT_TRACKER_HPP

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Module.h"
#include "../include/Helpers.hpp"

namespace TaintTracker {
    struct TaintTrackerPass : public llvm::PassInfoMixin<TaintTrackerPass> { // inheriting from PassInfoMixin, modern way to write LLVM passes (for LLVM >= 11)
    public:
        llvm::PreservedAnalyses run(llvm::Module &M, llvm::AnalysisManager<llvm::Module> &AM);
        void markTainted(llvm::Value* value, llvm::Instruction *Inst);
        bool isTainted(llvm::Value* value);
        
        void trackAliases(llvm::Instruction &Inst);
        void trackStructs(llvm::Instruction &Inst);
        void propagateTaint(llvm::Instruction &Inst);

        bool contains(llvm::StringRef func, const std::set<std::string> set);
        llvm::Value* getUltimatePointee(llvm::Value* ptr);
        void handleCI(llvm::CallInst *CI);
        bool isTaintedRecursive(llvm::Value* value);
        bool isTaintedRecursiveWrapper(llvm::Value* value, llvm::DenseSet<llvm::Value*>& visited);
    };
}

#endif // TAINT_TRACKER_HPP