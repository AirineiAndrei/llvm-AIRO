#include "airo.hpp"
#include "ipc.hpp"
#include <iostream>
#include "nlohmann/json.hpp"

using json = nlohmann::json;

namespace airo{
    std::optional<int> unroll_hook(llvm::Loop *L) {
    if (!L) return std::nullopt;

    json loop;
    if (auto *header = L->getHeader()) {
        loop["header"] = {{"name", header->getName().str()},
                          {"numInstructions", std::distance(header->begin(), header->end())}};
    }
    if (auto *latch = L->getLoopLatch()) {
        loop["latch"] = {{"name", latch->getName().str()}};
    }
    loop["depth"] = L->getLoopDepth();
    loop["isInnermost"] = L->isInnermost();
    json blocksJson;
    for (auto *BB : L->blocks()) {
        if (BB) {
            json block = {{"name", BB->getName().str()},
                          {"numInstructions", std::distance(BB->begin(), BB->end())}};
            json preds, succs;
            for (auto *Pred : predecessors(BB)) {
                preds.push_back(Pred->getName().str());
            }
            for (auto *Succ : successors(BB)) {
                succs.push_back(Succ->getName().str());
            }
            block["predecessors"] = preds;
            block["successors"] = succs;
            blocksJson.push_back(block);
        }
    }
    loop["blocks"] = blocksJson;

    json subloops;
    for (auto *SL : *L) {
        json subloop = {{"header", SL->getHeader()->getName().str()},
                        {"depth", SL->getLoopDepth()}};
        subloops.push_back(subloop);
    }
    loop["subloops"] = subloops;
    
    auto ans = IPC::getInstance()->send(loop.dump());
    return ans;
}
}
