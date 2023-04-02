PATH=${NDK_HOME_PATH}:${PATH}
bash ./clear.sh
ndk-build

## push and run app
RUN_BASE_DIR=/data/local/elfapp

adb wait-for-device
adb root
adb shell rm -rf ${RUN_BASE_DIR}/
adb shell mkdir -p ${RUN_BASE_DIR}/{lib,bin}
adb push libs/x86_64/calc_app_shared ${RUN_BASE_DIR}/bin/
adb push libs/x86_64/calc_app_static ${RUN_BASE_DIR}/bin/
adb push libs/x86_64/libcalc_test_shared.so ${RUN_BASE_DIR}/lib/

echo "run static lib app"
adb shell ${RUN_BASE_DIR}/bin/calc_app_static

echo "run shared lib app"
adb shell "export LD_LIBRARY_PATH=${RUN_BASE_DIR}/lib/:$LD_LIBRARY_PATH ; ${RUN_BASE_DIR}/bin/calc_app_shared"