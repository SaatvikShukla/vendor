# Copyright (C) 2014 OptiPop Project
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

# Check for target product

ifeq (optipop_manta,$(TARGET_PRODUCT))

# Define TARGET_ARCH for what toolchain libs to use.
TARGET_ARCH := arm

# Kernel toolchain
$(combo_2nd_arch_prefix)TARGET_GCC_VERSION_ARM := 4.8

# Include OptiPop common configuration
include vendor/optipop/config/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/manta/full_manta.mk)

# Override AOSP build properties
PRODUCT_NAME := optipop_manta
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 10
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME="manta" BUILD_FINGERPRINT="google/mantaray/manta:5.1/LMY47D/1743759:user/release-keys" PRIVATE_BUILD_DESC="mantaray-user 5.1 LMY47D 1743759 release-keys"

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/samsung/manta
TARGET_KERNEL_CONFIG := khaon_manta_defconfig

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/optipop/prebuilt/bootanimation/bootanimation_2560.zip:system/media/bootanimation.zip

endif
