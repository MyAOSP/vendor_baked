# Specify phone tech before including full_phone
$(call inherit-product, vendor/baked/configs/gsm.mk)

# Inherit baked common configs.
$(call inherit-product, vendor/baked/configs/common_full.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/i9100g/full_i9100g.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/baked/overlay/i9100

# Release name
PRODUCT_RELEASE_NAME := GT-I9100G

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := i9100g
PRODUCT_NAME := baked_i9100g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I9100G
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9100G TARGET_DEVICE=GT-I9100G BUILD_FINGERPRINT=samsung/GT-I9100G/GT-I9100G:4.1.2/JZO54K/I9100GXXLSR:user/release-keys PRIVATE_BUILD_DESC="GT-I9100G-user 4.1.2 JZO54K I9100GXXLSR release-keys"
# bootanimation
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation.zip
