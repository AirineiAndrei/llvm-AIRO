#pragma once

#include <string>
#include <optional>

class IPC {
private:
    std::string clientPipe;
    static IPC* instance;
    IPC();

public:
    IPC(IPC const&) = delete;
    void operator=(IPC const&) = delete;

    static IPC* getInstance();
    std::optional<int> send(const std::string& message);
    ~IPC();
};
