cmake_minimum_required(VERSION 3.0.0)
project(calcapp VERSION 0.1.0)

include(CTest)
enable_testing()
enable_language(ASM)

add_compile_options("-DTAG_TYPE='main_app_static'")

file(GLOB ALL_CALC_FUN_SRC ./calc_func_*.c)
file(GLOB ALL_CALC_TEST_SRC ./calc_test.c)
file(GLOB ALL_DATA_SRC ./data.S)
file(GLOB ALL_MAIN_SRC ./main.c)

file(GLOB DATA_FILE_SRC ./data.file)

message(STATUS "DATA_FILE : " ${DATA_FILE_SRC})

add_compile_options("-DDATA_FILE_PATH=${DATA_FILE_SRC}")

add_executable(calc_app ${ALL_MAIN_SRC}
                        ${ALL_DATA_SRC}
                        ${ALL_CALC_TEST_SRC}
                        ${ALL_CALC_FUN_SRC}
                )

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
