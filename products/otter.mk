$(call inherit-product, device/amazon/otter/device.mk)
$(call inherit-product, vendor/BlackICE/configs/common_tablet.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := BlackICE_otter
PRODUCT_DEVICE := otter
PRODUCT_BRAND := Android
PRODUCT_MODEL := Amazon Kindle Fire
PRODUCT_MANUFACTURER := Amazon
PRODUCT_RELEASE_NAME := KFire