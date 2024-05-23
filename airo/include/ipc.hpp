#pragma once

#include <string>
#include <optional>
#include <memory>

class IPC {
private:
    std::string clientPipeIn,clientPipeOut;
    static std::unique_ptr<IPC> instance;
    IPC();

public:
    IPC(IPC const&) = delete;
    void operator=(IPC const&) = delete;

    static const std::unique_ptr<IPC>& getInstance();
    std::optional<int> send(const std::string& message);
    ~IPC();
};
