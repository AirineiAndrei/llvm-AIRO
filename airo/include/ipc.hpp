#include <sys/types.h>
#include <sys/stat.h>
#include <stdexcept>
#include <fstream>
#include <string>
#include <cstdlib>
#include <cstring>
#include <cerrno>
#include <iostream>


class IPC {
private:
    const std::string pipeOutName,pipeInName;
    std::fstream pipeOut,pipeIn;

public:
    IPC() : pipeOutName("/tmp/airo-out"), pipeInName("/tmp/airo-in") {
        if (mkfifo(pipeOutName.c_str(), 0666) != 0) {
            if (errno != EEXIST) {
                throw std::runtime_error("Failed to create the pipeOut: " + std::string(strerror(errno)));
            }
        }

        if (mkfifo(pipeInName.c_str(), 0666) != 0) {
            if (errno != EEXIST) {
                throw std::runtime_error("Failed to create the pipeIn: " + std::string(strerror(errno)));
            }
        }

        pipeOut.open(pipeOutName, std::ifstream::in | std::ifstream::out);
        if (!pipeOut.is_open()) {
            throw std::runtime_error("Failed to open the pipeOut.");
        }

        pipeIn.open(pipeInName, std::fstream::in | std::ifstream::out);
        if (!pipeIn.is_open()) {
            throw std::runtime_error("Failed to open the pipeOut.");
        }
    }

    ~IPC() {
        // if (pipeOut.is_open()) {
        //     pipeOut.close();
        // }
        // if(pipeIn.is_open()) {
        //     pipeIn.close();
        // }
        // std::remove(pipeName.c_str()); when singleton
    }

    int send(const std::string& message) {
        if (!pipeOut.is_open()) {
            throw std::runtime_error("Pipe is not open.");
        }

        pipeOut << message << '\n';
        if (pipeOut.fail()) {
            throw std::runtime_error("Failed to write to the pipeOut.");
        }

        pipeOut.flush();

        int ans;
        pipeIn >> ans;
        std::cout << ans << std::endl;
        return ans;
    }
};
