# Top level cmake that builds llvm, clang and the addon libairo
# So that I do minimal modifications to llvm, and modularize my work
cmake_minimum_required(VERSION 3.22)

project(llvm-airo)

add_subdirectory(airo)

set(CMAKE_BUILD_TYPE Release)
# cherry pick what is needed
set(LLVM_TARGETS_TO_BUILD X86)
set(LLVM_ENABLE_PROJECTS clang)
set(LLVM_INCLUDE_TESTS OFF)
set(LLVM_INCLUDE_EXAMPLES OFF)
set(CLANG_INCLUDE_TESTS OFF)

add_subdirectory(llvm)
