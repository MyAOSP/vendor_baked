# Specify phone tech before including full_phone
$(call inherit-product, vendor/baked/configs/gsm.mk)

# Inherit baked common configs.
$(call inherit-product, vendor/baked/configs/common_full.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n7100/full_n7100.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/baked/overlay/i9100

# Release name
PRODUCT_RELEASE_NAME := GT-N7100

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n7100
PRODUCT_NAME := baked_n7100
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N7100
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t03gxx TARGET_DEVICE=t03g BUILD_FINGERPRINT="samsung/t03gxx/t03g:4.1.1/JRO03C/N7100XXALJ3:user/release-keys" PRIVATE_BUILD_DESC="t03gxx-user 4.1.1 JRO03C N7100XXALJ3 release-keys"

# bootanimation
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation.zip
