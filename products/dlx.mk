# Inherit cdma make
$(call inherit-product, vendor/baked/configs/cdma.mk)

# Inherit BAKED configuration.
$(call inherit-product, vendor/baked/configs/common_full.mk)

# Inherit device configuration for dlx
$(call inherit-product, device/htc/dlx/full_dlx.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/baked/overlay/dlx

# Release name
PRODUCT_RELEASE_NAME := dlx

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := dlx
PRODUCT_NAME := baked_dlx
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC6435LVW
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_dlx BUILD_FINGERPRINT=verizon_wwe/dlx/dlx:4.1.1/JRO03C/147796.1:user/release-keys PRIVATE_BUILD_DESC="2.06.605.1 CL147796 release-keys" BUILD_NUMBER=123160

# bootanimation
PRODUCT_COPY_FILES += \
   vendor/baked/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation.zip
