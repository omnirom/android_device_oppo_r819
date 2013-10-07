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

PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only

PRODUCT_COPY_FILES := \
    device/oppo/r819/fstab.mt6589:root/fstab.mt6589 \
    device/oppo/r819/init.mt6589.rc:root/init.mt6589.rc

# the actual meat of the device-specific product definition
$(call inherit-product, device/oppo/r819/device-common.mk)

# inherit from the non-open-source side, if present
$(call inherit-product, vendor/oppo/r819/r819-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only

DEVICE_PACKAGE_OVERLAYS := \
    device/oppo/r819/overlay
