# Inherit common CM stuff
$(call inherit-product, vendor/baked/config/common.mk)

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Orion.ogg \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/baked/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
endif
