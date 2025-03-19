cmake_minimum_required(VERSION 3.13.4)
project(TaintTracker)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

find_package(LLVM REQUIRED CONFIG)

include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

add_definitions(${LLVM_DEFINITIONS})

add_library(TaintTracker SHARED TaintTracker.cpp Helpers.cpp)

target_link_libraries(TaintTracker
  "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")