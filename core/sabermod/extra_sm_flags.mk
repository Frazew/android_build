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

EXTRA_SABERMOD_HOST_GCC_CFLAGS := \
    	-pipe \
    	-march=x86-64 \
    	-ftree-vectorize

ifeq ($(strip $(LOCAL_IS_HOST_MODULE)),true)
  ifneq ($(strip $(LOCAL_CLANG)),true)
    ifdef LOCAL_CFLAGS
      LOCAL_CFLAGS += \
        $(EXTRA_SABERMOD_HOST_GCC_CFLAGS)
    else
      LOCAL_CFLAGS := \
        $(EXTRA_SABERMOD_HOST_GCC_CFLAGS)
    endif
  endif
endif
