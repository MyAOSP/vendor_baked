# Inherit AOSP device configuration for ville.
$(call inherit-product, device/htc/ville/device_ville.mk)

# Inherit common product files.
$(call inherit-product, vendor/baked/configs/common_full.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/baked/configs/gsm.mk)

# Setup device specific product configuration.
PRODUCT_NAME := baked_ville
PRODUCT_BRAND := HTC
PRODUCT_DEVICE := ville
PRODUCT_MODEL := HTC One S
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_ville BUILD_FINGERPRINT=tmous/ville/ville:4.0.4/IMM76D/96068.7:user/release-keys PRIVATE_BUILD_DESC="=2.35.531.7 CL96068 release-keys" BUILD_NUMBER=96068

# bootanimation
PRODUCT_COPY_FILES += \
vendor/baked/prebuilt/bootanimation/bootanimation_540_960.zip:system/media/bootanimation.zip