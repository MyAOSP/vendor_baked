$(call inherit-product, vendor/baked/configs/common_full_tablet.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n8013/full_n8013.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := baked_n8013
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := n8013
PRODUCT_MODEL := GT-N8013
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N8013 TARGET_DEVICE=GT-N8013 BUILD_FINGERPRINT="samsung/p4noterfxx/p4noterf:4.0.4/IMM76D/N8000XWALG9:user/release-keys" PRIVATE_BUILD_DESC="samsung/p4notewifiue/p4notewifi:4.0.4/IMM76D/N8013UEALH2:user/release-keys"

# bootanimation
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/bootanimation/bootanimation_1280_800.zip:system/media/bootanimation.zip
