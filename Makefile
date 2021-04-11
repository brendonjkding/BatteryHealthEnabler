TARGET = iphone:clang:latest:7.0
ARCHS= arm64 arm64e

INSTALL_TARGET_PROCESSES = Preferences

TWEAK_NAME = BatteryHealthEnabler

BatteryHealthEnabler_FILES = Tweak.xm
BatteryHealthEnabler_CFLAGS = -fobjc-arc

ADDITIONAL_CFLAGS += -Wno-error=unused-variable -Wno-error=unused-function -Wno-error=unused-value -include Prefix.pch

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
