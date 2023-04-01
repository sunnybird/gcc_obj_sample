ALL_C_FILE=$(ls *.c)
rm *.o
rm *.a
rm *.so
rm *.bin
## compile all c files
echo "compile all c files"
for file in ${ALL_C_FILE}
do
  gcc -c -v ${file} -o ${file}.o -fPIC
done

ALL_CALC_FUNC_OBJ_FILE=$(ls calc_func_*.o)
## combine all func o files
all_calc_func_obj=calc_func.o
echo "combine all calc_func_* o files into ${all_calc_func_obj}"
ld -relocatable -v ${ALL_CALC_FUNC_OBJ_FILE} -o ${all_calc_func_obj}

ALL_CALC_TEST_OBJ_FILE=$(ls calc_test*.o)
## create calc_test static lib
echo "building static calc_test lib file ........."
static_calc_test_file=libcalc_test_static_lib.a
ar rcvs ${static_calc_test_file} ${all_calc_func_obj} ${ALL_CALC_TEST_OBJ_FILE}

## create calc_test shared lib
echo "building shared calc_test lib file ........."
shared_calc_test_file=libcalc_test_shared_lib.so
gcc -v -shared -o ${shared_calc_test_file} ${all_calc_func_obj} ${ALL_CALC_TEST_OBJ_FILE}

ALL_MAIN_OBJ_FILE=$(ls main*.o)
## create execute file
exe_static_file=main_app_static.bin
exe_shared_file=maim_app_shared.bin

echo "building execute file for ${exe_static_file}........."
gcc -v ${ALL_MAIN_OBJ_FILE} -L ./ -l calc_test_static_lib -o ${exe_static_file}

echo "building execute file for ${exe_shared_file}........."
gcc -v ${ALL_MAIN_OBJ_FILE} -L ./ -l calc_test_shared_lib -o ${exe_shared_file}


echo "run exe file - {exe_static_file}"
# run static main app
./main_app_static.bin

echo "run exe file - {exe_shared_file}"
# run shared main app
export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
./maim_app_shared.bin
