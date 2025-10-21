#!/bin/sh
##############################################################################
##############################################################################
###                                                                        ###
###                        Let's start MDA software                        ###
###                                                                        ###
##############################################################################
##############################################################################

# export path with scripts
export PATH='/usr/local/bin':$PATH
export TSLIB_TSDEVICE=/dev/input/event1
export TSLIB_CALIBFILE=/mnt/touchscreen.calibration

# restore alsa mixer settings
/usr/sbin/alsactl -U restore

# first - kill all already runing copy
killall mda

if [ -f $TSLIB_CALIBFILE ]; then
    echo Use savved touchscreen calibration
else
    /usr/local/bin/remount_storage_read_write.sh
    ts_calibrate
    /usr/local/bin/remount_storage_read_only.sh
fi

# next - start new copy of software
/usr/local/bin/mda 2>&1 >/dev/null&

# Let's BOTH red and green leds show MDA running
/bin/echo 1 > /sys/class/leds/red-led/brightness
