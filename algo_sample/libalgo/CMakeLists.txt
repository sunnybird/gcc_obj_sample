cmake_minimum_required(VERSION 3.0.0)

include(CTest)
enable_testing()
include_directories(public)

add_library(algo STATIC libalgo.c func_warp.c foo.cpp runtime.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
