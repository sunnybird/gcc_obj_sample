cmake_minimum_required(VERSION 3.0.0)
project(algomain VERSION 0.1.0 LANGUAGES C)

include(CTest)
enable_testing()

include_directories("/home/fengjinlong/workspace/projects/CLionProjects/libalgo/public")

add_executable(algomain main.c mymem.c)

# target_link_directories(algomain PUBLIC /home/fengjinlong/workspace/projects/CLionProjects/libalgo/build)
# target_link_libraries(algomain algo)
target_link_directories(algomain PUBLIC /home/fengjinlong/workspace/projects/CLionProjects/libalgo/libalgo)
target_link_libraries(algomain algo_one)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

include(CPack)
