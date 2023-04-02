LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := calc_func
LOCAL_C_INCLUDES :=
LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g
LOCAL_MULTILIB := 64

# LOCAL_MODULE_SUFFIX := .o
# LOCAL_SRC_FILES := lib/calc_func.o

AR = $(TOP)/prebuilts/clang/host/linux-x86/llvm-binutils-stable/llvm-ar
static_calc_func_file = $(TOP)/$(LOCAL_PATH)/lib/calc_func.a
all_calc_func_obj     = $(TOP)/$(LOCAL_PATH)/lib/calc_func.o

$(shell $(AR) rcvs $(static_calc_func_file) $(all_calc_func_obj))

$(info ============= calc_func ==============)
$(info ======================================)
$(info TOP: $(TOP))
$(info AR: $(AR))
$(info static_calc_func_file: $(static_calc_func_file))
$(info all_calc_func_obj: $(all_calc_func_obj))
$(info ============= calc_func ==============)

LOCAL_MODULE_SUFFIX := .a
LOCAL_SRC_FILES := lib/calc_func.a

LOCAL_MODULE_CLASS := STATIC_LIBRARIES
include $(BUILD_PREBUILT)
# include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := calc_test_static
LOCAL_C_INCLUDES := $(LOCAL_PATH)/inc
LOCAL_SRC_FILES :=  src/calc_test.c
# LOCAL_STATIC_LIBRARIES := calc_func
LOCAL_WHOLE_STATIC_LIBRARIES := calc_func

LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g
LOCAL_MULTILIB := 64
include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := calc_test_shared
LOCAL_C_INCLUDES := $(LOCAL_PATH)/inc
LOCAL_SRC_FILES :=  src/calc_test.c
LOCAL_STATIC_LIBRARIES := calc_func
# LOCAL_WHOLE_STATIC_LIBRARIES := calc_func

LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g
LOCAL_MULTILIB := 64
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := calc_app_static
LOCAL_C_INCLUDES := $(LOCAL_PATH)/inc
LOCAL_SRC_FILES :=  src/main.c
LOCAL_STATIC_LIBRARIES := calc_test_static
# LOCAL_WHOLE_STATIC_LIBRARIES := calc_test_static

LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g
LOCAL_CFLAGS += -DTAG_TYPE='"calc_app_static"'
LOCAL_MULTILIB := 64
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE := calc_app_shared
LOCAL_C_INCLUDES := $(LOCAL_PATH)/inc
LOCAL_SRC_FILES :=  src/main.c
LOCAL_SHARED_LIBRARIES := calc_test_shared
LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -std=c11 -g
LOCAL_CFLAGS += -DTAG_TYPE='"calc_app_shared"'
LOCAL_MULTILIB := 64
include $(BUILD_EXECUTABLE)



