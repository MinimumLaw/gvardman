export LANG=C.UTF-8
export PATH='/usr/local/bin':$PATH
export QT_QPA_EGLFS_KMS_CONFIG=/usr/local/bin/kms.json

mount /mnt -o remount,rw

export TSLIB_TSDEVICE=/dev/input/event1
export TSLIB_CALIBFILE=/mnt/ts.calibrate
export QT_QPA_EGLFS_NO_LIBINPUT=1
export QT_QPA_EGLFS_TSLIB=1
export QT_QPA_GENERIC_PLUGINS=tslib
export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="tslib"
export QT_QPA_EGLFS_HIDECURSOR=0
