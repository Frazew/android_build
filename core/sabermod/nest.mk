# Copyright (C) 2015 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
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

LOCAL_DISABLE_NEST := \
	libFraunhoferAAC \
	libskia \
	libstagefright \
	libopus \
	libart-compiler \
	libavcodec \
	libwebrtc_spl \
	libcrypto_static \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support \
	Email

# Disable Bluetooth if building on arm-linux-androideabi-4.9+
LOCAL_DISABLE_NEST += \
	$(LOCAL_BLUETOOTH_BLUEDROID)

ifneq (1,$(words $(filter $(LOCAL_DISABLE_NEST), $(LOCAL_MODULE))))
  ifdef LOCAL_CFLAGS
    LOCAL_CFLAGS += \
	-floop-nest-optimize
  else
    LOCAL_CFLAGS := \
	-floop-nest-optimize
  endif
endif
