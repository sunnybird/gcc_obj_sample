PATH=${NDK_HOME_PATH}:${PATH}
bash ./clear.sh
ndk-build

## push and run app

adb shell mkdir /data/local/{lib,bin}
adb push libs/x86_64/calc_app_shared /data/local/bin/
adb push libs/x86_64/calc_app_static /data/local/bin/
adb push libs/x86_64/libcalc_test_shared.so /data/local/lib/

echo "run static lib app"
adb shell /data/local/bin/calc_app_static

echo "run shared lib app"
adb shell "export LD_LIBRARY_PATH=/data/local/lib/:$LD_LIBRARY_PATH ; /data/local/bin/calc_app_shared"