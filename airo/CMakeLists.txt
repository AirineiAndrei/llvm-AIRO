set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS Off)

set(TARGET airo)

set(LLVM_INCLUDE "${CMAKE_SOURCE_DIR}/llvm/include")
set(LLVM_INCLUDE_GEN "${CMAKE_BINARY_DIR}/llvm/include")

set(AIRO_INCLUDE "${CMAKE_CURRENT_SOURCE_DIR}/include")
set(AIRO_INCLUDE "${AIRO_INCLUDE}" PARENT_SCOPE)
set(AIRO_BINARY "${CMAKE_CURRENT_BINARY_DIR}")
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

message("llvm ${LLVM_INCLUDE} ${LLVM_INCLUDE_GEN}")

add_library(
    ${TARGET} STATIC
    src/airo.cpp
    src/ipc.cpp
)
target_include_directories(
    ${TARGET}
    PRIVATE 
    ${AIRO_INCLUDE}
    ${LLVM_INCLUDE}
    ${LLVM_INCLUDE_GEN}
)

# maybe fix install
# install(TARGETS airo
#   EXPORT LLVMExportedTargets
#   LIBRARY DESTINATION lib
#   ARCHIVE DESTINATION lib
#   RUNTIME DESTINATION bin
#   INCLUDES DESTINATION include
# )