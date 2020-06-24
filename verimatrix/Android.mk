# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Copyright The Android Open Source Project

LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE := libvmx_dvb
LOCAL_MULTILIB := 32
LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES := \
    src/vmx_main.c \
    src/vmx_interact.c \
    src/vmx_porting.c

LOCAL_C_INCLUDES := \
		$(LOCAL_PATH)/include \
		$(LOCAL_PATH)/../libamcas/include \
		$(LOCAL_PATH)/../libcJSON \
		$(LOCAL_PATH)/../liblinuxdvb_port/include \

LOCAL_SHARED_LIBRARIES += liblog \
  libcutils \
  libutils \
  libsecmem_sys \
  libteec_sys

LOCAL_STATIC_LIBRARIES += libvmx_ree_dual_aml \
  liblinuxdvb_port \
  libcJSON \
  libcaclientapi

LOCAL_STRIP_MODULE := false

LOCAL_CFLAGS += -O0 -DANDROID

ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 30&& echo OK),OK)
    LOCAL_PROPRIETARY_MODULE := true
    LOCAL_SHARED_LIBRARIES += libsecmem libteec
else
    LOCAL_SHARED_LIBRARIES += libsecmem_sys libteec_sys
endif

#include $(BUILD_SHARED_LIBRARY)
