#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Kernel Targets
ifeq ($(TARGET_PREBUILT_KERNEL),)
ifeq ($(TARGET_KERNEL_CONFIG),)
TARGET_PREBUILT_KERNEL := device/htc/tattoo/kernel
endif # TARGET_KERNEL_CONFIG
endif # TARGET_PREBUILT_KERNEL

DEVICE_PACKAGE_OVERLAYS := device/htc/tattoo/overlay

PRODUCT_PACKAGES += \
    librs_jni \
    sensors.bahamas

PRODUCT_LOCALES += mdpi

# Live wallpaper packages
PRODUCT_PACKAGES := \
    LiveWallpapersPicker \
    librs_jni

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS := device/htc/tattoo/overlay

$(call inherit-product, device/htc/tattoo/device_tattoo-vendor-blobs.mk)


# from device_dream_sapphire.mk
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

PRODUCT_PROPERTY_OVERRIDES := \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.ecc.HTC-Russia=01,02,03,04,001,002,003,004 \
    ro.ril.ecc.HTC-EastEurope=92,93,94 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.hep = 1 \
    ro.ril.enable.dtm = 1 \
    ro.ril.gprsclass = 12 \
    ro.ril.hsdpa.category = 8 \
    ro.ril.hsxpa = 1 \
    ro.ril.def.agps.mode = 2 \
    wifi.interface = tiwlan0 \
    ro.ril.htcmaskw1.bitmask = 4294967295 \
    ro.ril.htcmaskw1 = 14449

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=30

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 120 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120

# Default network type
# 0 => WCDMA Preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65536

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-http=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-record=true \
    media.stagefright.enable-scan=true

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/htc/tattoo/media_profiles.xml:/system/etc/media_profiles.xml

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full.mk)

