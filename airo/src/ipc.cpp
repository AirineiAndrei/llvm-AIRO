#include "ipc.hpp"
#include <iostream>
#include <fstream>
#include <sstream>
#include <filesystem>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <memory>

const std::string serverPipe = "/tmp/airo/decision-maker";
const std::string clientPipeBase = "/tmp/airo/client_pipe_";

std::unique_ptr<IPC> IPC::instance = nullptr;

IPC::IPC() {
    std::stringstream ss;
    ss << clientPipeBase << getpid();
    std::string clientPipe = ss.str();
    clientPipeIn = clientPipe + "_in";
    clientPipeOut = clientPipe + "_out";

    mkfifo(clientPipeIn.c_str(), 0666);
    mkfifo(clientPipeOut.c_str(), 0666);

    // Send HELLO message with client pipe name to the server pipe
    std::ofstream serverStream(serverPipe);
    if (!serverStream) {
        std::cerr << "Failed to open server pipe" << std::endl;
    } else {
        serverStream << "HELLO " << clientPipe << std::endl;
        serverStream.close();
    }
}

const std::unique_ptr<IPC>& IPC::getInstance() {
    if (instance == nullptr) {
        instance = std::unique_ptr<IPC>(new IPC());
    }
    return instance;
}

std::optional<int> IPC::send(const std::string& message) {
    std::ofstream reqStream(clientPipeOut);
    if (!reqStream) {
        std::cerr << "Failed to open out client pipe" << std::endl;
        return std::nullopt;
    }
    reqStream << message << std::endl;
    reqStream.close();

    std::ifstream resStream(clientPipeIn);
    if (!resStream) {
        std::cerr << "Failed to open in client pipe" << std::endl;
        return std::nullopt;
    }
    std::string response;
    getline(resStream, response);
    resStream.close();

    try {
        return std::stoi(response);
    } catch (std::exception& e) {
        std::cerr << "Error converting response to int: " << e.what() << std::endl;
        return std::nullopt;
    }
}

IPC::~IPC() {
    auto ans = IPC::getInstance()->send("END");

    unlink(clientPipeIn.c_str());
    unlink(clientPipeOut.c_str());
}