# Specify phone tech before including full_phone
$(call inherit-product, vendor/baked/configs/gsm.mk)

# Inherit baked common configs.
$(call inherit-product, vendor/baked/configs/common_full.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n7000/full_n7000.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/baked/overlay/i9100

# Release name
PRODUCT_RELEASE_NAME := GT-N7000

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n7000
PRODUCT_NAME := baked_n7000
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N7000
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N7000 TARGET_DEVICE=GT-N7000 BUILD_FINGERPRINT=samsung/GT-N7000/GT-N7000:4.0.3/IML74K/ZCLP6:user/release-keys PRIVATE_BUILD_DESC="GT-N7000-user 4.0.3 IML74K ZCLP6 release-keys"

# bootanimation
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/bootanimation/bootanimation_800_1280.zip:system/media/bootanimation.zip
