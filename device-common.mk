#
# Copyright (C) 2010 The Android Open Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := device/oppo/r819/kernel
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi


PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=MediaTekRIL

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/oppo/r819/root/ueventd.mt6589.rc:root/ueventd.mt6589.rc \
    device/oppo/r819/root/init.mt6589.usb.rc:root/init.mt6589.usb.rc \
    device/oppo/r819/root/init.modem.rc:root/init.modem.rc \
    device/oppo/r819/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
    device/oppo/r819/modules/ccci.ko:system/lib/modules/ccci.ko \
    device/oppo/r819/modules/ccci_plat.ko:system/lib/modules/ccci_plat.ko \
    device/oppo/r819/modules/devapc.ko:system/lib/modules/devapc.ko \
    device/oppo/r819/modules/devinfo.ko:system/lib/modules/devinfo.ko \
    device/oppo/r819/modules/hid-logitech-dj.ko:system/lib/modules/hid-logitech-dj.ko \
    device/oppo/r819/modules/mtk_fm_drv.ko:system/lib/modules/mtk_fm_drv.ko \
    device/oppo/r819/modules/mtk_hif_sdio.ko:system/lib/modules/mtk_hif_sdio.ko \
    device/oppo/r819/modules/mtklfb.ko:system/lib/modules/mtklfb.ko \
    device/oppo/r819/modules/mtk_stp_bt.ko:system/lib/modules/mtk_stp_bt.ko \
    device/oppo/r819/modules/mtk_stp_gps.ko:system/lib/modules/mtk_stp_gps.ko \
    device/oppo/r819/modules/mtk_stp_uart.ko:system/lib/modules/mtk_stp_uart.ko \
    device/oppo/r819/modules/mtk_stp_wmt.ko:system/lib/modules/mtk_stp_wmt.ko \
    device/oppo/r819/modules/mtk_wmt_wifi.ko:system/lib/modules/mtk_wmt_wifi.ko \
    device/oppo/r819/modules/pvrsrvkm.ko:system/lib/modules/pvrsrvkm.ko \
    device/oppo/r819/modules/scsi_tgt.ko:system/lib/modules/scsi_tgt.ko \
    device/oppo/r819/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/oppo/r819/modules/sec.ko:system/lib/modules/sec.ko \
    device/oppo/r819/modules/vcodec_kernel_driver.ko:system/lib/modules/vcodec_kernel_driver.ko \
    device/oppo/r819/modules/wlan.ko:system/lib/modules/wlan.ko \
    device/oppo/r819/modules/wlan_mt6628.ko:system/lib/modules/wlan_mt6628.ko

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_COPY_FILES += \
    device/oppo/r819/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

PRODUCT_PACKAGES := \
    audio.primary.default \
    audio.a2dp.default \
    audio.usb.default \
    camera.default \
    gps.default \
    keystore.default \
    libaudio.r_submix.default \
    libaudio.usb.default \
    lights.mt6589 \
    local_time.default \
    power.default \
    sensors.default \
    librs_jni \
    setup_fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory

# NFC packages
PRODUCT_PACKAGES += \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_PACKAGES += \
    mkmtkbootimg


PRODUCT_CHARACTERISTICS := nosdcard

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media codec config xml file
PRODUCT_COPY_FILES += \
    device/oppo/r819/media_codecs.xml:system/etc/media_codecs.xml

# Bluetooth config file
#PRODUCT_COPY_FILES += \
#    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/oppo/r819/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/oppo/r819/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

WIFI_BAND := 802_11_BG
# $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
