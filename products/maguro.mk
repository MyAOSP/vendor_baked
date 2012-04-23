# Inherit AOSP device configuration for maguro.
$(call inherit-product, device/samsung/maguro/full_maguro.mk)

# Inherit common product files.
$(call inherit-product, vendor/BlackICE/configs/common_phone.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/BlackICE/configs/gsm.mk)

# Tuna overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/BlackICE/overlay/tuna
PRODUCT_PACKAGE_OVERLAYS += vendor/BlackICE/overlay/maguro

# Setup device specific product configuration.
PRODUCT_NAME := BlackICE_maguro
PRODUCT_BRAND := google
PRODUCT_DEVICE := maguro
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=yakju BUILD_ID=IMM76D BUILD_FINGERPRINT=google/yakju/maguro:4.0.4/IMM76D/299849:user/release-keys PRIVATE_BUILD_DESC="yakju-user 4.0.4 IMM76D 299849 release-keys" BUILD_NUMBER=299849

# Copy maguro specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/BlackICE/prebuilt/tuna/Thinkfree.apk:system/app/Thinkfree.apk \
    vendor/BlackICE/prebuilt/xhdpi/bootanimation.zip:system/media/bootanimation.zip \
    vendor/BlackICE/prebuilt/tuna/vold.fstab:system/etc/vold.fstab
