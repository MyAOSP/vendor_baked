#
# Copyright (C) 2012 The CyanogenMod Project
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

## Specify phone tech before including full_phone
$(call inherit-product, vendor/baked/configs/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := GT-I9100G

# Inherit some common CM stuff.
$(call inherit-product, vendor/baked/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/baked/overlay/d2-common

# Inherit device configuration
$(call inherit-product, device/samsung/i9100g/full_i9100g.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := i9100g
PRODUCT_NAME := baked_i9100g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I9100G
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9100G TARGET_DEVICE=GT-I9100G BUILD_FINGERPRINT=samsung/GT-I9100G/GT-I9100G:4.0.3/IML74K/XXLPQ:user/release-keys PRIVATE_BUILD_DESC="GT-I9100G-user 4.0.3 IML74K XXLPQ release-keys"

# bootanimation
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation.zip
