## Specify phone tech before including full_phone
$(call inherit-product, vendor/baked/configs/cdma.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/showcasemtd/full_showcasemtd.mk)

# Inherit common product files.
$(call inherit-product, vendor/baked/configs/common_phone.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/baked/overlay/aries-common

# Release name
PRODUCT_RELEASE_NAME := Showcase

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := showcasemtd
PRODUCT_NAME := baked_showcasemtd
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SCH-I500

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SCH-I500 TARGET_DEVICE=SCH-I500 BUILD_FINGERPRINT=uscc/SCH-I500/SCH-I500:2.3.4/GINGERBREAD/EH09:user/release-keys PRIVATE_BUILD_DESC="SCH-I500-user 2.3.4 GINGERBREAD EH09 release-keys"

# bootanimation
PRODUCT_COPY_FILES += \
	vendor/baked/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation.zip
