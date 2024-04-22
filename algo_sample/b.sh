rm -rf build
mkdir build

HEXAGON_SDK=$HOME/workspace/Qualcomm/Hexagon_SDK/5.5.0.1/5.5.0.1

source ${HEXAGON_SDK}/setup_sdk_env.source

cmake -B build -DCMAKE_TOOLCHAIN_FILE=${HEXAGON_SDK}/build/cmake/hexagon_toolchain.cmake -S $(pwd)
