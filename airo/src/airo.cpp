#include "airo.hpp"
#include "ipc.hpp"
#include <iostream>
#include "nlohmann/json.hpp"
#include <llvm/IR/Instructions.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/Analysis/DominanceFrontier.h>
#include <llvm/ADT/SmallVector.h>

using json = nlohmann::json;

namespace airo {
    std::optional<int> unroll_hook(llvm::Loop *L) {
        if (!L) return std::nullopt;

        json loop;

        auto countInstructions = [](llvm::BasicBlock *BB) {
            int numPHINodes = 0;
            int numCalls = 0;
            int numLoads = 0;
            int numStores = 0;
            int numArith = 0;
            int numBranches = 0;

            for (auto &I : *BB) {
                if (llvm::isa<llvm::PHINode>(&I)) {
                    numPHINodes++;
                } else if (llvm::isa<llvm::CallInst>(&I)) {
                    numCalls++;
                } else if (llvm::isa<llvm::LoadInst>(&I)) {
                    numLoads++;
                } else if (llvm::isa<llvm::StoreInst>(&I)) {
                    numStores++;
                } else if (llvm::isa<llvm::BinaryOperator>(&I)) {
                    numArith++;
                } else if (llvm::isa<llvm::BranchInst>(&I)) {
                    numBranches++;
                }
            }

            return json{
                {"numInstructions", std::distance(BB->begin(), BB->end())},
                {"numPHINodes", numPHINodes},
                {"numCalls", numCalls},
                {"numLoads", numLoads},
                {"numStores", numStores},
                {"numArith", numArith},
                {"numBranches", numBranches}
            };
        };

        // Loop Header Information
        if (auto *header = L->getHeader()) {
            loop["header"] = countInstructions(header);
        }

        // Loop Latch Information
        if (auto *latch = L->getLoopLatch()) {
            loop["latch"] = countInstructions(latch);
        }

        // General Loop Information
        loop["depth"] = L->getLoopDepth();
        loop["isInnermost"] = L->isInnermost();
        loop["numBlocks"] = L->getNumBlocks();
        loop["numBackEdges"] = L->getNumBackEdges();
        loop["isRotatedForm"] = L->isLoopSimplifyForm();

        // Count the number of exit blocks
        llvm::SmallVector<llvm::BasicBlock*, 8> exitBlocks;
        L->getExitBlocks(exitBlocks);
        loop["numExitBlocks"] = exitBlocks.size();


        // Loop Blocks Information
        json blocksJson;
        for (auto *BB : L->blocks()) {
            if (BB) {
                json block = countInstructions(BB);

                block["numPredecessors"] = std::distance(pred_begin(BB), pred_end(BB));
                block["numSuccessors"] = std::distance(succ_begin(BB), succ_end(BB));

                blocksJson.push_back(block);
            }
        }
        loop["blocks"] = blocksJson;

        // Subloops Information
        json subloops;
        for (auto *SL : *L) {
            json subloop = {
                {"depth", SL->getLoopDepth()},
                {"numBlocks", SL->getNumBlocks()},
                {"isInnermost", SL->isInnermost()},
                {"numSubLoops", SL->getSubLoops().size()}
            };
            subloops.push_back(subloop);
        }
        loop["subloops"] = subloops;

        // Send Serialized Data
        auto ans = IPC::getInstance()->send(loop.dump());
        return ans;
    }
}
