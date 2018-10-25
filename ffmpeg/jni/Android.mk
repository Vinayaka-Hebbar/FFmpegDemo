LOCAL_PATH := $(call my-dir)

FFMPEG = $(LOCAL_PATH)/ffmpeg
FFMPEG_PATH=$(LOCAL_PATH)/ffmpeg/android/$(TARGET_ARCH_ABI)
FFMPEG_INCLUDE=$(FFMPEG_PATH)/include
FFMPEG_LIB=$(FFMPEG_PATH)/lib

include $(CLEAR_VARS)
LOCAL_MODULE:= libavcodec
LOCAL_SRC_FILES:= $(FFMPEG_LIB)/libavcodec.so
LOCAL_EXPORT_C_INCLUDES := $(FFMPEG_INCLUDE)
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= libavformat
LOCAL_SRC_FILES:= $(FFMPEG_LIB)/libavformat.so
LOCAL_EXPORT_C_INCLUDES := $(FFMPEG_INCLUDE)
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= libavdevice
LOCAL_SRC_FILES:= $(FFMPEG_LIB)/libavdevice.so
LOCAL_EXPORT_C_INCLUDES := $(FFMPEG_INCLUDE)
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= libavfilter
LOCAL_SRC_FILES:= $(FFMPEG_LIB)/libavfilter.so
LOCAL_EXPORT_C_INCLUDES := $(FFMPEG_INCLUDE)
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= libavutil
LOCAL_SRC_FILES:= $(FFMPEG_LIB)/libavutil.so
LOCAL_EXPORT_C_INCLUDES := $(FFMPEG_INCLUDE)
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= libswresample
LOCAL_SRC_FILES:= $(FFMPEG_LIB)/libswresample.so
LOCAL_EXPORT_C_INCLUDES := $(FFMPEG_INCLUDE)
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= libswscale
LOCAL_SRC_FILES:= $(FFMPEG_LIB)/libswscale.so
LOCAL_EXPORT_C_INCLUDES := $(FFMPEG_INCLUDE)
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := videokit
LOCAL_LDLIBS := -llog -ljnigraphics -lz -landroid
ANDROID_LIB := -landroid
LOCAL_C_INCLUDES:=$(FFMPEG)
#LOCAL_EXPORT_C_INCLUDES := $(FFMPEG_INCLUDE)
#LOCAL_CFLAGS :=$(FFMPEG)
LOCAL_LDLIBS += -lz
LOCAL_SRC_FILES :=  videokit.c ffmpeg.c ffmpeg_filter.c ffmpeg_opt.c cmdutils.c ffmpeg_cuvid.c ffmpeg_hw.c logjam.c
LOCAL_SHARED_LIBRARIES := libavformat libavcodec libswscale libavutil libswresample libavfilter libavdevice

include $(BUILD_SHARED_LIBRARY)