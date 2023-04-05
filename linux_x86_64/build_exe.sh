# CC=$(which clang)
# $CC calc_func_add.c calc_func_sub.c calc_func_div.c calc_func_mul.c calc_test.c data.S main.c \
# -o calc_main_app

BUILD_DIR=build-camke
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
cd ${BUILD_DIR}
CC=clang CXX=clang++ cmake .. -G Ninja
ninja
./calc_app
cd ..
rm -rf ${BUILD_DIR}