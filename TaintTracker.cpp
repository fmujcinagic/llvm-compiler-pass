#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Module.h"


using namespace llvm;

const std::set<std::string> sources = {"scanf", "gets", "fgets", "read"};
const std::set<std::string> sinks = {"strcpy", "sprintf", "memcpy", "system"};
llvm::DenseSet<Value *> tainted_values; // tracking IR values

struct TaintTrackerPass : public PassInfoMixin<TaintTrackerPass> { // inheriting from PassInfoMixin, modern way to write LLVM passes (for LLVM >= 11)
    private:
        // helper function to check occurrences
        bool contains(StringRef func, std::set<std::string> set) {
            for (const auto& source : set) {
                if (func.contains(source)) {
                    return true;
                }
            }
            return false;
        }
        bool isTainted(Value *value) {
            return tainted_values.find(value) != tainted_values.end();
        }
        void markTainted(Value *value) {
            tainted_values.insert(value);
        }
        void handleCI(CallInst *CI) {
            // errs() << "this is ci: " << CI << "\n";
            if(CI->getCalledFunction()->getName().contains("scanf")) {
                for (Use &U : CI->operands()) {
                    errs() << "Tainted value: " << *U << "\n";
                }
                errs() << CI->getOperand(2)->getName() << " is tainted\n";
                markTainted(CI->getOperand(2));
            }
        }
    public: 
        PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) { 
            errs() << "-----------------Taint Tracker-----------------\n";
            for (auto &F : M.functions()) {
                for (auto &BB : F) {                
                    // errs() << "tracking function: " << F.getName() << "\n";
                    for (auto &Inst : BB) {         
                        if (auto *CI = dyn_cast<CallInst>(&Inst)) {
                            if (CI->getCalledFunction() != nullptr) {
                                if(contains(CI->getCalledFunction()->getName(), sources)) {
                                    errs() << "Found source: " << CI->getCalledFunction()->getName() << " in " << F.getName() << "\n";
                                    handleCI(CI);
                                }
                                // if(contains(CI->getCalledFunction()->getName(), sinks)) {
                                    // errs() << "Found sink: " << CI->getCalledFunction()->getName() << " in " << F.getName() << "\n";
                                // }
                            }
                        }
                    }
                }
            }
            errs() << "end of the output" << "\n";
            return PreservedAnalyses::all();
        };
};

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo(){
    return {
        LLVM_PLUGIN_API_VERSION, "taint-tracker", LLVM_VERSION_STRING,
        [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, ModulePassManager &MPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "taint-tracker") {
                        MPM.addPass(TaintTrackerPass());
                        return true;
                    }
                    return false;
                });
        }};
}