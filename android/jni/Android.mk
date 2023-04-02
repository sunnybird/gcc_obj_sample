LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := calc_func
LOCAL_C_INCLUDES := 
LOCAL_SRC_FILES := lib/libcalc_func.a
LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := calc_test_static
LOCAL_C_INCLUDES := $(LOCAL_PATH)/inc
LOCAL_SRC_FILES :=  src/calc_test.c
# LOCAL_STATIC_LIBRARIES := calc_func
LOCAL_WHOLE_STATIC_LIBRARIES := calc_func

LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := calc_test_shared
LOCAL_C_INCLUDES := $(LOCAL_PATH)/inc
LOCAL_SRC_FILES :=  src/calc_test.c
# LOCAL_STATIC_LIBRARIES := calc_func
LOCAL_WHOLE_STATIC_LIBRARIES := calc_func

LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g

include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := calc_app_static
LOCAL_C_INCLUDES := $(LOCAL_PATH)/inc
LOCAL_SRC_FILES :=  src/main.c
# LOCAL_STATIC_LIBRARIES := calc_test_static
LOCAL_WHOLE_STATIC_LIBRARIES := calc_test_static

LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g
LOCAL_CFLAGS += -DTAG_TYPE='"calc_app_static"'
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE := calc_app_shared
LOCAL_C_INCLUDES := $(LOCAL_PATH)/inc
LOCAL_SRC_FILES :=  src/main.c
LOCAL_STATIC_LIBRARIES := calc_test_shared
LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g
LOCAL_CFLAGS += -DTAG_TYPE='"calc_app_shared"'

include $(BUILD_EXECUTABLE)



