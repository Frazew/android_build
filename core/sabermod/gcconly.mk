# Copyright (C) 2015 The SaberMod Project
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
#

# Bluetooth modules should not be optimized at all in GCC4.9+
LOCAL_BLUETOOTH_BLUEDROID := \
   	bluetooth.default \
   	libbt-brcm_stack \
   	audio.a2dp.default \
   	libbt-brcm_gki \
   	libbt-utils \
   	libbt-qcom_sbc_decoder \
   	libbt-brcm_bta \
   	bdt \
   	bdtest \
   	libbt-hci \
   	libosi \
   	ositests \
   	libbt-vendor \
   	libbluetooth_jni

LOCAL_DISABLE_GCCONLY := \
	libfs_mgr \
	bluetooth.default \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support

# Disable Bluetooth if building on arm-linux-androideabi-4.9+
LOCAL_DISABLE_GCCONLY += \
	$(LOCAL_BLUETOOTH_BLUEDROID)

GCC_FLAGS := \
	-fira-loop-pressure \
        -fforce-addr \
        -funsafe-loop-optimizations \
        -funroll-loops \
        -ftree-loop-distribution \
        -fsection-anchors \
        -ftree-loop-im \
        -ftree-loop-ivcanon \
        -ffunction-sections \
        -fgcse-las \
        -fgcse-sm \
        -fweb \
        -ffp-contract=fast \
        -mvectorize-with-neon-quad

ifneq (1,$(words $(filter $(LOCAL_DISABLE_GCCONLY), $(LOCAL_MODULE))))
  ifdef LOCAL_CONLYFLAGS
    LOCAL_CONLYFLAGS += $(GCC_FLAGS)
  else
    LOCAL_CONLYFLAGS := $(GCC_FLAGS)
  endif

  ifdef LOCAL_CPPFLAGS
    LOCAL_CPPFLAGS += $(GCC_FLAGS)
  else
    LOCAL_CPPFLAGS := $(GCC_FLAGS)
  endif
endif
