#!/bin/sh

/bin/echo "Remount read-only..."

/bin/mount -o remount,rw /dev/mmcblk1p3 /mnt
if test $? = '0'; then
	exit 1
else
	exit 0
fi
