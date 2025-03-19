#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Module.h"
#include "Helpers.hpp"

using namespace llvm;

const std::set<std::string> sources = {"scanf", "fgets", "read"};
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

        // helper function to check if passed value is tainted
        bool isTainted(Value *value) {
            if(!value) return false;
            if (tainted_values.find(value) != tainted_values.end()) {
                return true;
            }
            return false;
        }
        bool isTaintedRecursive(Value *value){
            if(!value) return false;
            if (tainted_values.find(value) != tainted_values.end()) {
                return true;
            }
            if (auto *Inst = dyn_cast<Instruction>(value)) {
                for (auto &Op : Inst->operands()) {
                    if (isTainted(Op.get())) {
                        return true;
                    }
                }
            }
            return false;
        }


        // helper function to mark value as tainted
        void markTainted(Value *value, Instruction *Inst = nullptr) {
            assert(value != nullptr && "Desired value is null!");
            if(isTainted(value)) {
                errs() << "[!] Already tainted: " << *value << "\n";
                return;
            }
            errs() << "==> Tainting:" << *value;
            if (Inst) TaintAnalysis::Helpers::printDebugInfo(Inst);
            tainted_values.insert(value);
        }
        
        void handleCI(CallInst *CI) {
            // errs() << "this is ci: " << CI << "\n";
            // for(Use &U : CI->operands()) {
            //     errs() << "fgets arg: " << *U << "\n";
            // }
            if(CI->getCalledFunction()->getName().contains("scanf")) {
                markTainted(CI->getOperand(1), CI);
            }
            if(CI->getCalledFunction()->getName().contains("fgets")) {
                markTainted(CI->getOperand(0), CI);
            }
        }
        
        void propagateTaint(Instruction &Inst) {
            // If %val is tainted → then mark %ptr as tainted.
            // example:
            // int tainted = input_from_user();
            // int unsafe; unsafe = tainted;  // 'unsafe' becomes tainted
            auto *storeInst = dyn_cast<StoreInst>(&Inst);
            if(storeInst) { 
                if(isTainted(storeInst->getValueOperand())) {
                    markTainted(storeInst->getPointerOperand(), storeInst);
                }
            }
            
            // loading from tainted memory
            // example:
            // int tainted = input_from_user();
            // int x = tainted;     
            auto *loadInst = dyn_cast<LoadInst>(&Inst);
            if (loadInst) {
                if (isTainted(loadInst->getPointerOperand())) {
                    markTainted(loadInst, loadInst);
                }
            }
            
            // pointer operations on tainted pointers produce tainted pointers
            // example: char *ptr = tainted_ptr + 10;
            if (isa<BitCastInst>(&Inst) || isa<GetElementPtrInst>(&Inst)) {
                for (auto &op : Inst.operands()) {
                    if (isTainted(op.get())) {
                        markTainted(&Inst, &Inst);
                        break;
                    }
                }
            }
            
            // example:
            // int tainted = input_from_user();  
            // int x = tainted + 5;         
            if (Inst.isBinaryOp()) {
                for (auto &op : Inst.operands()) {
                    if (isTainted(op.get())) {
                        markTainted(&Inst, &Inst);
                        break;
                    }
                }
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
                                if(contains(CI->getCalledFunction()->getName(), sinks)) {
                                    for (auto &arg : CI->args()) {
                                        if (isTaintedRecursive(arg.get())) {
                                            errs() << Colors::RED << "WARNING: Tainted value used in sink function " << CI->getCalledFunction()->getName() << Colors::RESET;
                                            if (&Inst) TaintAnalysis::Helpers::printDebugInfo(&Inst);
                                        }
                                    }
                                }
                            }
                        }
                        if(&Inst != nullptr)
                            propagateTaint(Inst);
                        else
                            {errs() << "Cannot propagate taint\n";
                            assert(0);}
                    }
                }
            }
            errs() << "--------------- Taint Tracking Complete ---------------\n";
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