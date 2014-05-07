LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    android_renderscript_RenderScript.cpp

LOCAL_SHARED_LIBRARIES := \
        libRSSupport \
        libjnigraphics

LOCAL_STATIC_LIBRARIES := \
        libcutils \
        liblog

rs_generated_include_dir := $(call intermediates-dir-for,SHARED_LIBRARIES,libRSSupport,,)

LOCAL_C_INCLUDES += \
	$(JNI_H_INCLUDE) \
	frameworks/rs \
	$(rs_generated_include_dir)

LOCAL_CFLAGS +=

LOCAL_LDLIBS := -lpthread
LOCAL_ADDITIONAL_DEPENDENCIES := $(addprefix $(rs_generated_include_dir)/,rsgApiFuncDecl.h)
ifeq ($(FLAG_GMS_AVAILABLE),yes)
LOCAL_MODULE:= librsjni_old
else
LOCAL_MODULE:= librsjni
endif
LOCAL_ADDITIONAL_DEPENDENCIES += $(rs_generated_source)
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := libRSSupport

include $(BUILD_SHARED_LIBRARY)
