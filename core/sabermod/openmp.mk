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

LOCAL_DISABLE_OPENMP := \
	libwebviewchromium \
	libc_netbsd

ifneq (1,$(words $(filter $(LOCAL_DISABLE_OPENMP), $(LOCAL_MODULE))))
  ifdef LOCAL_CFLAGS
    LOCAL_CFLAGS += -lgomp -lgcc -fopenmp
  else
    LOCAL_CFLAGS := -lgomp -lgcc -fopenmp
  endif

  ifdef LOCAL_LDLIBS
    LOCAL_LDLIBS += -lgomp -lgcc
  else
    LOCAL_LDLIBS := -lgomp -lgcc
  endif
endif
