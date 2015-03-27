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

ifeq (optipop_togari,$(TARGET_PRODUCT))

# Define TARGET_ARCH for what toolchain libs to use.
TARGET_ARCH := arm

# Include OptiPop common configuration
include vendor/optipop/config/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/sony/togari/full_togari.mk)

# Override AOSP build properties
PRODUCT_NAME := optipop_togari
PRODUCT_BRAND := XPERIA
PRODUCT_MODEL := Z Ultra
PRODUCT_MANUFACTURER := Sony

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/sony/msm8974
TARGET_KERNEL_CONFIG := cm_rhine_togari_row_defconfig

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/optipop/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip

endif
