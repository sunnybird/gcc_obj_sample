rm -rf build
mkdir build

cmake -B build -S $(pwd)

cd build
make