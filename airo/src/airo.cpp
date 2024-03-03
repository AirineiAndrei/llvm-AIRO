#include "airo.hpp"
#include "ipc.hpp"
#include <iostream>

namespace airo{
    std::optional<int> unroll_hook(llvm::Loop *L)
    {
        std::cout << "Unroll hook" << std::endl;
        // TODO: seriaaalize loop
        auto ans = IPC::getInstance()->send("looooooooooooooop");
        return ans;
    }
}

