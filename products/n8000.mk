# Inherit AOSP device configuration for n8000
$(call inherit-product, vendor/baked/configs/common_full_tablet.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/baked/configs/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n8000/full_n8000.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := baked_n8000
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := n8000
PRODUCT_MODEL := GT-N8000
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N8000 TARGET_DEVICE=GT-N8000 BUILD_FINGERPRINT="samsung/p4noterfxx/p4noterf:4.0.4/IMM76D/N8000XWALG9:user/release-keys" PRIVATE_BUILD_DESC="p4noterfxx-user 4.0.4 IMM76D N8000XWALG9 release-keys"

# bootanimation
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/bootanimation/bootanimation_1280_800.zip:system/media/bootanimation.zip
