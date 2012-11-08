$(call inherit-product, device/samsung/d2mtr/full_d2mtr.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/baked/configs/cdma.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/baked/overlay/d2vzw

# Enhanced NFC
#$(call inherit-product, vendor/baked/configs/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/baked/configs/common_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d2mtr TARGET_DEVICE=d2mtr BUILD_FINGERPRINT="d2mtr-user 4.0.4 IMM76D R530MVQALJ1 release-keys" PRIVATE_BUILD_DESC="samsung/d2mtr/d2mtr:4.0.4/IMM76D/R530MVQALJ1:user/release-keys"

PRODUCT_NAME := baked_d2mtr
PRODUCT_DEVICE := d2mtr

