CC=
LD=
AR=
TARGET="x86-64"
TARGET="android"

if [[ "$TARGET" == "x86-64" ]]; then
  CC=$(which gcc)
  LD=$(which ld)
  AR=$(which ar)

elif [[ "$TARGET" == "android" ]]; then
  NDK_HOME=${NDK_HOME_PATH}
  # CC=${NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android30-clang
  CC=${NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/x86_64-linux-android30-clang
  LD=${NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/ld
  AR=${NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar

fi

ALL_C_FILE=$(ls *.c *.S)
rm *.o
rm *.a
rm *.so
rm *.bin
## compile all c files
echo "compile all c files"
for file in ${ALL_C_FILE}; do
  $CC -c -v ${file} -o ${file}.o -fPIC
done

ALL_CALC_FUNC_OBJ_FILE=$(ls calc_func_*.o data*.o)
## combine all func o files
all_calc_func_obj=calc_func.o
static_calc_func_file=libcalc_func.a
echo "combine all calc_func_* o files into ${all_calc_func_obj}"
$LD -relocatable -v ${ALL_CALC_FUNC_OBJ_FILE} -o ${all_calc_func_obj}
$AR rcvs ${static_calc_func_file} ${all_calc_func_obj}

ALL_CALC_TEST_OBJ_FILE=$(ls calc_test*.o)
## create calc_test static lib
echo "building static calc_test lib file ........."
static_calc_test_file=libcalc_test_static_lib.a
$AR rcvs ${static_calc_test_file} ${all_calc_func_obj} ${ALL_CALC_TEST_OBJ_FILE}

## create calc_test shared lib
echo "building shared calc_test lib file ........."
shared_calc_test_file=libcalc_test_shared_lib.so
$CC -v -shared -o ${shared_calc_test_file} ${all_calc_func_obj} ${ALL_CALC_TEST_OBJ_FILE}

ALL_MAIN_OBJ_FILE=$(ls main*.o)
## create execute file
exe_static_file=main_app_static.bin
exe_shared_file=main_app_shared.bin

echo "building execute file for ${exe_static_file}........."
$CC -v ${ALL_MAIN_OBJ_FILE} -L ./ -l calc_test_static_lib -o ${exe_static_file}

echo "building execute file for ${exe_shared_file}........."
$CC -v ${ALL_MAIN_OBJ_FILE} -L ./ -l calc_test_shared_lib -o ${exe_shared_file}

if [[ "$TARGET" == "x86-64" ]]; then

  echo "run exe file - {exe_static_file}"
  # run static main app
  ./${exe_static_file}

  echo "run exe file - {exe_shared_file}"
  # run shared main app
  export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
  ./${exe_shared_file}

fi
