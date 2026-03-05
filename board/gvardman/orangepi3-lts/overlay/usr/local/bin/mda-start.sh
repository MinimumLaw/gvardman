#!/bin/sh
##############################################################################
##############################################################################
###                                                                        ###
###                        Let's start MDA software                        ###
###                                                                        ###
##############################################################################
##############################################################################

# export path with scripts
export LANG=C.UTF-8
export PATH='/usr/local/bin':$PATH
export QT_QPA_EGLFS_KMS_CONFIG=/usr/local/bin/kms.json
export TSLIB_TSDEVICE=/dev/input/event1
export TSLIB_CALIBFILE=/mnt/touchscreen.calibration
export QT_QPA_EGLFS_NO_LIBINPUT=1
export QT_QPA_EGLFS_TSLIB=1
export QT_QPA_GENERIC_PLUGINS=tslib
export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="tslib"
export QT_QPA_EGLFS_HIDECURSOR=1
# export QT_QPA_PLATFORM=linuxfb

# restore alsa mixer settings
/usr/sbin/alsactl -U restore

# first - kill all already runing copy
killall mda

if [ -f $TSLIB_CALIBFILE ]; then
    echo Use saved touchscreen calibration
else
    echo Calibrate touchscreen parameters
    /usr/local/bin/remount_storage_read_write.sh
    ts_calibrate
    /usr/local/bin/remount_storage_read_only.sh
fi

# next - start new copy of software
/usr/local/bin/mda 2>&1 >/dev/null&

# Let's BOTH red and green leds show MDA running
/bin/echo 1 > /sys/class/leds/red-led/brightness
