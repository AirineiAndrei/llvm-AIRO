set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS Off)

set(TARGET airo)

set(AIRO_INCLUDE "${CMAKE_CURRENT_SOURCE_DIR}/include")
set(AIRO_INCLUDE "${AIRO_INCLUDE}" PARENT_SCOPE)
set(AIRO_BINARY "${CMAKE_CURRENT_BINARY_DIR}")
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_library(
    ${TARGET} STATIC
    src/airo.cpp
)
message("include is ${AIRO_INCLUDE}")
target_include_directories(
    ${TARGET}
    PRIVATE 
    ${AIRO_INCLUDE}
)

# maybe fix install
# install(TARGETS airo
#   EXPORT LLVMExportedTargets
#   LIBRARY DESTINATION lib
#   ARCHIVE DESTINATION lib
#   RUNTIME DESTINATION bin
#   INCLUDES DESTINATION include
# )