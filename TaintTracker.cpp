#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Module.h"
#include "Helpers.hpp"

using namespace llvm;

const std::set<std::string> sources = {"scanf", "fgets", "read", "copy_from_user", "get_user"}; // I've used normal set here
const std::set<std::string> sinks = {"strcpy", "strncpy", "sprintf", "snprintf", "vsprintf", "vsnprintf",
    "memcpy", "system", "memset", "strncpy", "write"}; // I've used normal set here
llvm::DenseSet<Value *> tainted_values; // tracking IR values
llvm::DenseMap<Value*, Value*> pointer_aliases;
llvm::DenseMap<Value*, Value*> points_to;

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
            auto it = pointer_aliases.find(value);
            if (it != pointer_aliases.end() && tainted_values.find(it->second) != tainted_values.end()) {
                return true;
            }
            return false;
        }

        Value* getUltimatePointee(Value* ptr) {
            Value* current = ptr;
            std::set<Value*> visited;
            
            while (true) {
                if (visited.count(current) > 0) break;
                visited.insert(current);
                
                auto it = points_to.find(current);
                if (it == points_to.end()) break;
                
                current = it->second;
            }
            
            return current;
        }

        bool isTaintedRecursive(Value *value){
            if(!value) return false;
            if (isTainted(value)) {
                return true;
            }
            for (const auto &pair : pointer_aliases) {
                if (pair.first == value && isTainted(pair.second)) {
                    return true;
                }
                if (pair.second == value && isTainted(pair.first)) {
                    return true;
                }
            }

            auto pointeeIt = points_to.find(value);
            if (pointeeIt != points_to.end() && isTainted(pointeeIt->second)) {
                return true;
            }

            for (const auto &pair : points_to) {
                if (pair.second == value && isTainted(pair.first)) {
                    return true;
                }
            }
            
            // if (auto *loadInst = dyn_cast<LoadInst>(value)) {
            //     if (isTaintedRecursive(loadInst->getPointerOperand())) {
            //         return true;
            //     }
            // }
            
            if (auto *GEP = dyn_cast<GetElementPtrInst>(value)) {
                if (isTaintedRecursive(GEP->getPointerOperand())) {
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
                    if (isTaintedRecursive(Op.get())) {
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

            for (const auto &pair : pointer_aliases) {
                // TODO: rewrite this using rec
                if (pair.second == value) {
                    if(isTainted(pair.first)) return;
                    errs() << "==> Tainting:" << pair.first;
                    if (Inst) TaintAnalysis::Helpers::printDebugInfo(Inst);
                    tainted_values.insert(pair.first);
                }
                if (pair.first == value) {
                    if(isTainted(pair.second)) return;
                    errs() << "==> Tainting:" << pair.second;
                    if (Inst) TaintAnalysis::Helpers::printDebugInfo(Inst);
                    tainted_values.insert(pair.second);
                }
            }

            if (auto *loadInst = dyn_cast<LoadInst>(value)) { //if this is a pointer thats loaded from the memory --> taint the memory location too!
                markTainted(loadInst->getPointerOperand(), Inst);
            }
        }
            
        void handleCI(CallInst *CI) {
            // errs() << "this is ci: " << CI << "\n";
            // for(Use &U : CI->operands()) {
            //     errs() << "fgets arg: " << *U << "\n";
            // }
            if(!CI || !CI->getCalledFunction()) return;
            if (contains(CI->getCalledFunction()->getName(), sources)) {
                for (Use &U : CI->args()) {
                    markTainted(U.get(), CI);
                    
                    if (U.get()->getType()->isPointerTy()) {
                        auto *load_instr = dyn_cast<LoadInst>(U.get());
                        // TODO: recheck again later ... 
                        if(load_instr) {
                            markTainted(load_instr->getPointerOperand(), CI); //like what we see with alias = ptr
                            auto *ptr = dyn_cast<AllocaInst>(load_instr->getPointerOperand());
                            if(ptr) {
                                pointer_aliases[ptr] = load_instr->getPointerOperand(); // we just follow the chain
                            }
                            Value* pointee = getUltimatePointee(load_instr->getPointerOperand()); // TODO: recheck!! 
                            if (pointee) {
                                markTainted(pointee, CI);
                            }
                        }

                    }
                }
            }
            // if(CI->getCalledFunction()->getName().contains("scanf")) {
            //     markTainted(CI->getOperand(1), CI);
            // }
            // if(CI->getCalledFunction()->getName().contains("fgets")) {
            //     markTainted(CI->getOperand(0), CI);
            // }
        }
        
        void trackAliases(Instruction &Inst) {
            auto *storeInst = dyn_cast<StoreInst>(&Inst);
            if (storeInst) {
                Value *valueOp = storeInst->getValueOperand(); // source
                Value *ptrOp = storeInst->getPointerOperand(); // destination
                
                if (valueOp && valueOp->getType() && valueOp->getType()->isPointerTy() && ptrOp) {
                    // This is a pointer assignment: ptr1 = ptr2
                    pointer_aliases[ptrOp] = valueOp;
                    errs() << "==> Recording alias: " << *ptrOp << " -> " << *valueOp;
                    TaintAnalysis::Helpers::printDebugInfo(&Inst);
                }
                points_to[ptrOp] = valueOp;
            }
            
            if (auto *loadInst = dyn_cast<LoadInst>(&Inst)) {
                Value *ptrOp = loadInst->getPointerOperand();
                Value *loadedVal = loadInst;

                auto it = points_to.find(ptrOp);
                if (it != points_to.end()) {
                    points_to[loadedVal] = it->second;
                }
            }

            // Handle function arguments for aliasing
            if (auto *callInst = dyn_cast<CallInst>(&Inst)) {
                Function *calledFunc = callInst->getCalledFunction();
                if (calledFunc && !calledFunc->isDeclaration()) {
                    // For each pointer argument, create an alias between the formal and actual parameter
                    for (unsigned i = 0; i < callInst->arg_size() && i < calledFunc->arg_size(); i++) {
                        Value *actualArg = callInst->getArgOperand(i);
                        Value *formalArg = calledFunc->getArg(i);
                        
                        pointer_aliases[formalArg] = actualArg;
                        errs() << "==> Recording parameter alias: " << *formalArg << " -> " << *actualArg;
                        TaintAnalysis::Helpers::printDebugInfo(&Inst);

                        if (actualArg->getType()->isPointerTy()) { // if its pointer we record wha it points to
                            auto it = points_to.find(actualArg);
                            if (it != points_to.end()) {
                                points_to[formalArg] = it->second;
                            }
                        }
                    }
                }
            }
        }

        void propagateTaint(Instruction &Inst) {
            auto *retInst = dyn_cast<ReturnInst>(&Inst);
            if (retInst) {
                if (Value *retVal = retInst->getReturnValue()) {
                    if (isTainted(retVal)) {
                        markTainted(&Inst, &Inst); // Mark ReturnInst as tainted (indirectly marks function return)
                    }
                }
            }
            
            if (auto *callInst = dyn_cast<CallInst>(&Inst)) {
                Function *calledFunc = callInst->getCalledFunction();
                if (calledFunc && !calledFunc->isDeclaration()) {

                    for (unsigned i = 0; i < callInst->arg_size() && i < calledFunc->arg_size(); i++) {
                        Value *arg = callInst->getArgOperand(i);
                        if (isTaintedRecursive(arg)) {
                            markTainted(calledFunc->getArg(i), &Inst);
                        }
                    }

                    for (auto &BB : *calledFunc) {
                        for (auto &I : BB) {
                            if (auto *retInst = dyn_cast<ReturnInst>(&I)) {
                                if (isTaintedRecursive(retInst->getReturnValue())) { // tainted check to recursive one
                                    markTainted(callInst, callInst); // Mark CallInst itself tainted
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            // If %val is tainted → then mark %ptr as tainted.
            // example:
            // int tainted = input_from_user();
            // int unsafe; unsafe = tainted;  // 'unsafe' becomes tainted
            auto *storeInst = dyn_cast<StoreInst>(&Inst);
            if(storeInst) { 
                if(isTaintedRecursive(storeInst->getValueOperand())) { // tainted check to recursive one
                    markTainted(storeInst->getPointerOperand(), storeInst);
                    auto *LI = dyn_cast<LoadInst>(storeInst->getPointerOperand());
                    if (LI) {
                        markTainted(LI->getPointerOperand(), storeInst); // TODO: recheck this
                    }
                    Value* pointee = getUltimatePointee(storeInst->getPointerOperand());
                    if (pointee) {
                        markTainted(pointee, storeInst);
                    }
                }
            }
            
            // loading from tainted memory
            // example:
            // int tainted = input_from_user();
            // int x = tainted;     
            auto *loadInst = dyn_cast<LoadInst>(&Inst);
            if (loadInst) {
                if (isTaintedRecursive(loadInst->getPointerOperand())) {
                    markTainted(loadInst, loadInst);
                }
                for (const auto &pair : pointer_aliases) { // TODO: recheck this
                    if (pair.first == loadInst->getPointerOperand() && isTaintedRecursive(pair.second)) {
                        markTainted(loadInst, loadInst);
                    }
                }
                Value* ultimatePtr = getUltimatePointee(loadInst->getPointerOperand());
                if (ultimatePtr && isTaintedRecursive(ultimatePtr)) {
                    markTainted(loadInst, loadInst);
                }
            }
            
            // pointer operations on tainted pointers produce tainted pointers
            // example: char *ptr = tainted_ptr + 10;
            if (isa<BitCastInst>(&Inst) || isa<GetElementPtrInst>(&Inst)) {
                for (auto &op : Inst.operands()) {
                    if (isTaintedRecursive(op.get())) {
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
                    if (isTaintedRecursive(op.get())) {
                        markTainted(&Inst, &Inst);
                        break;
                    }
                }
            }
          
        }
    public: 
        PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) { 
            errs() << "-----------------Taint Tracker-----------------\n";

            errs() << " --- ALIAS TRACKING STARTED! ---\n";
            for (auto &F : M.functions()) {
                for (auto &BB : F) {                
                    for (auto &Inst : BB) {         
                        trackAliases(Inst);
                    }
                }
            }
            errs() << " --- ALIAS TRACKING COMPLETED! ---\n";

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
                                            // errs() << "Tainted value passed to function: " << CI->getCalledFunction()->getName() << " at argument " << i;
                                            // if (&Inst) TaintAnalysis::Helpers::printDebugInfo(&Inst);
                                            
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
                // if (changed) {
                //     errs() << ">> Iteration " << iteration << "; Found " << (tainted_values.size() - tainted_before) << " new tainted values\n";
                // }
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
            // errs() << "pointer aliases" << "\n";
            // for (const auto &pair : pointer_aliases) {
            //     errs() << *pair.first << " -> " << *pair.second << "\n";
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