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
            if (auto *GEP = dyn_cast<GetElementPtrInst>(value)) {
                if (isTainted(GEP->getPointerOperand())) {
                    return true;
                }
                Value *basePtr = GEP->getPointerOperand();
                for (auto *taintedVal : tainted_values) {
                    if (auto *otherGEP = dyn_cast<GetElementPtrInst>(taintedVal)) {
                        if (otherGEP->getPointerOperand() == basePtr) {
                            return true;
                        }
                    }
                }
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
                // errs() << "[!] Already tainted: " << *value << "\n";
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
            if(!CI || !CI->getCalledFunction()) return;
            if(CI->getCalledFunction()->getName().contains("scanf")) {
                markTainted(CI->getOperand(1), CI);
            }
            // if(CI->getCalledFunction()->getName().contains("fgets")) {
            //     markTainted(CI->getOperand(0), CI);
            // }
            // if (contains(CI->getCalledFunction()->getName(), sources)) {
            //     for (Use &U : CI->args()) {
            //         markTainted(U.get(), CI);
            //     }
            // }
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
            // 1st step: Identify all sources and initial taint
            for (auto &F : M.functions()) {
                for (auto &BB : F) {                
                    // errs() << "tracking function: " << F.getName() << "\n";
                    for (auto &Inst : BB) {         
                        if (auto *CI = dyn_cast<CallInst>(&Inst)) {
                            if (CI->getCalledFunction() != nullptr) {
                                if(contains(CI->getCalledFunction()->getName(), sources)) {
                                    errs() << "[+] Found source: " << CI->getCalledFunction()->getName() << " in " << F.getName();
                                    if (&Inst) TaintAnalysis::Helpers::printDebugInfo(&Inst);
                                    handleCI(CI);
                                }
                            }
                        }
                    }
                }
            }
            // 2nd step: Propagate taint
            errs() << " --- TAINT PROPAGATION STARTED! ---\n";
            bool changed = true;
            int iteration = 0;
            const int MAX_ITERATIONS = 10; // chosen 10 for now, for iterative approach ; TODO: discuss 
            while (changed && iteration < MAX_ITERATIONS) {
                size_t tainted_before = tainted_values.size();
                iteration++;
                
                for (auto &F : M.functions()) {
                    for (auto &BB : F) {
                        for (auto &Inst : BB) {
                            if (auto *CI = dyn_cast<CallInst>(&Inst)) {
                                if (CI->getCalledFunction() && !contains(CI->getCalledFunction()->getName(), sources)) {
                                    for (unsigned i = 0; i < CI->arg_size(); i++) {
                                        Value *arg = CI->getArgOperand(i);
                                        if (isTaintedRecursive(arg)) {
                                            errs() << "Tainted value passed to function: " << CI->getCalledFunction()->getName() << " at argument " << i;
                                            if (&Inst) TaintAnalysis::Helpers::printDebugInfo(&Inst);
                                            
                                            // taint func params
                                            if (Function *calledFunc = CI->getCalledFunction()) {
                                                if (!calledFunc->isDeclaration() && i < calledFunc->arg_size()) { // we want to check for declaration to see if a func has a body in our module
                                                    markTainted(calledFunc->getArg(i), &Inst);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            propagateTaint(Inst);
                        }
                    }
                }
                
                changed = (tainted_values.size() > tainted_before);
                if (changed) {
                    errs() << ">> Iteration " << iteration << "; Found " << (tainted_values.size() - tainted_before) << " new tainted values\n";
                }
            }
            errs() << " --- TAINT PROPAGATION ENDED! ---\n";
            // 3rd step: Check for sinks
            for (auto &F : M.functions()) {
                for (auto &BB : F) {                
                    // errs() << "tracking function: " << F.getName() << "\n";
                    for (auto &Inst : BB) {         
                        if (auto *CI = dyn_cast<CallInst>(&Inst)) {
                            if (CI->getCalledFunction() != nullptr) {
                                llvm::StringRef func_name = CI->getCalledFunction()->getName();
                                if(contains(func_name, sinks)) {
                                    for (auto &arg : CI->args()) {
                                        if (isTaintedRecursive(arg)) {
                                            errs() << Colors::RED << "WARNING: Tainted value reached sink: " << func_name << Colors::RESET;
                                            if (&Inst) TaintAnalysis::Helpers::printDebugInfo(&Inst);
                                        }
                                    }
                                } 
                            }
                        }
                    }
                }
            }            
            // errs() << "Tainted values: \n";
            // for (auto *val : tainted_values) {
            //     errs() << *val << "\n";
            // }
            
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