cmake_minimum_required(VERSION 3.0.0)
project(algomain VERSION 0.1.0 LANGUAGES CXX)

include(CTest)
enable_testing()

include_directories($(CMAKE_CURRENT_SOURCE_DIR)/../libalgo/public)

add_executable(algomain main.c mymem.c)

# target_link_directories(algomain PUBLIC $(CMAKE_CURRENT_BINARY_DIR)/libalgo)
# target_link_libraries(algomain algo)
target_link_directories(algomain PUBLIC /home/fengjinlong/workspace/projects/CProjects/gcc_obj_sample/algo_sample/libalgo/libalgo)
target_link_libraries(algomain algo_one)
set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

include(CPack)
