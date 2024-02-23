#include "airo.hpp"
#include "ipc.hpp"
#include <iostream>

namespace airo{
    std::optional<int> unroll_hook(llvm::Loop *L)
    {
        std::unique_ptr<IPC> ipc;
        try
        {
            ipc = std::make_unique<IPC>();
        }catch(...)
        {
            std::cout<<"error on pipe"<<std::endl;
        }
        int ans = ipc->send("Hello from clang");
        std::cout << "Loop depth " << L->getLoopDepth() << std::endl;
        return ans;
    }
}

