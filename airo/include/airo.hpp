#pragma once 
#include <optional>
#include "llvm/Analysis/LoopInfo.h"

namespace airo{
    std::optional<int> unroll_hook(llvm::Loop *L); 
}

