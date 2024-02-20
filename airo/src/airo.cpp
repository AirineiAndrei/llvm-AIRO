#include "airo.hpp"
#include <iostream>

namespace airo{
    std::optional<int> unroll_hook(llvm::Loop *L)
    {
        std::cout<<"Hello";
        std::cout << "Loop depth " << L->getLoopDepth() << std::endl;
        return 20;
    }
}

