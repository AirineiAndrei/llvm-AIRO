#include "airo.hpp"
#include <iostream>

namespace airo{
    std::optional<int> unroll_hook()
    {
        std::cout << "Unroll hook" << std::endl;
        return 20;
    }
}

