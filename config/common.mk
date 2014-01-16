SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.baked.superuser

ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))

# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/baked/prebuilt/common/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_BOOTANIMATION := vendor/baked/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1


ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Future use of this maybe
# Copy over the changelog to the device
# PRODUCT_COPY_FILES += \
#    vendor/baked/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/baked/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/baked/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh \
    vendor/baked/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/baked/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# CM-specific init file
PRODUCT_COPY_FILES += \
    vendor/baked/prebuilt/common/etc/init.local.rc:root/init.cm.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/baked/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/baked/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is baked! Kanged from cm obviously
PRODUCT_COPY_FILES += \
    vendor/baked/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# T-Mobile theme engine
include vendor/baked/config/themes_common.mk

# Required packages
PRODUCT_PACKAGES += \
    Development \
    LatinIME \
    BluetoothExt

# Optional packages
PRODUCT_PACKAGES += \
    VoiceDialer \
    SoundRecorder \
    Basic \
    libemoji

# Custom packages
    #Trebuchet \

PRODUCT_PACKAGES += \
    Launcher3 \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    CMFileManager \
    LockClock

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# Extra tools from CM
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    vim \
    nano \
    htop \
    powertop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)

PRODUCT_PACKAGES += \
    procmem \
    procrank \
    Superuser \
    su

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1
else

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

endif

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/baked/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/baked/overlay/common

PRODUCT_VERSION_NICK = kk
PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE,$(BAKED_BUILDTYPE)),)
    BAKED_BUILDTYPE :=
endif

ifeq ($(BAKED_BUILDTYPE), RELEASE)
    BAKED_BUILDTYPE := RELEASE
else
    BAKED_BUILDTYPE := UNOFFICIAL
endif

# Set the version here
ifeq ($(BAKED_BUILDTYPE), RELEASE)
    BAKED_VERSION := $(PRODUCT_VERSION_NICK)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(BAKED_BUILD)
else
    ifeq ($(PRODUCT_VERSION_MINOR),0)
        BAKED_VERSION := $(PRODUCT_VERSION_NICK)-$(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d)-$(BAKED_BUILDTYPE)-$(BAKED_BUILD)
    else
        BAKED_VERSION := $(PRODUCT_VERSION_NICK)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date -u +%Y%m%d)-$(BAKED_BUILDTYPE)-$(BAKED_BUILD)
    endif
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.baked.version=$(BAKED_VERSION) \
  ro.modversion=$(BAKED_VERSION)
