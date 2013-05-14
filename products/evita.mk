# Inherit GSM make.
$(call inherit-product, vendor/baked/configs/gsm.mk)

# Inherit BAKED configuration.
$(call inherit-product, vendor/baked/configs/common_full.mk)

# Inherit device configuration for evita.
$(call inherit-product, device/htc/evita/device_evita.mk)

# Setup device specific product configuration.
PRODUCT_NAME := baked_evita
PRODUCT_BRAND := HTC
PRODUCT_DEVICE := evita
PRODUCT_MODEL := HTC One X
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_evita BUILD_FINGERPRINT=cingular_us/evita/evita:4.0.4/IMM76D/79936.7:user/release-keys PRIVATE_BUILD_DESC="2.20.502.7 CL79936 release-keys" BUILD_NUMBER=79936

# bootanimation
PRODUCT_COPY_FILES += \
vendor/baked/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation.zip
