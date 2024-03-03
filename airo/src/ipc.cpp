#include "ipc.hpp"
#include <iostream>
#include <fstream>
#include <sstream>
#include <filesystem>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

const std::string serverPipe = "/tmp/decision-maker";
const std::string clientPipeBase = "/tmp/client_pipe_";

IPC* IPC::instance = nullptr;

IPC::IPC() {
    std::stringstream ss;
    ss << clientPipeBase << getpid();
    clientPipe = ss.str();
    mkfifo(clientPipe.c_str(), 0666);
}

IPC* IPC::getInstance() {
    if (instance == nullptr) {
        instance = new IPC();
    }
    return instance;
}

std::optional<int> IPC::send(const std::string& message) {
    std::ofstream serverStream(serverPipe);
    if (!serverStream) {
        std::cerr << "Failed to open server pipe" << std::endl;
        return std::nullopt;
    }
    serverStream << clientPipe << " " << message << std::endl;
    serverStream.close();

    std::ifstream clientStream(clientPipe);
    if (!clientStream) {
        std::cerr << "Failed to open client pipe" << std::endl;
        return std::nullopt;
    }
    std::string response;
    getline(clientStream, response);
    clientStream.close();

    try {
        return std::stoi(response);
    } catch (std::exception& e) {
        std::cerr << "Error converting response to int: " << e.what() << std::endl;
        return std::nullopt;
    }
}

IPC::~IPC() {
    unlink(clientPipe.c_str());
    std::filesystem::remove(clientPipe);
}
