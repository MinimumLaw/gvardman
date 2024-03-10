#!/bin/sh

DEV=''

for block_dev in /sys/block/sd?; do
	if [ -e "$block_dev" ]; then
		if test `cat $block_dev/removable` = '1'; then
			DEV=`basename $block_dev`
		fi
	fi
done

if test "$DEV" != ''; then
	if [ ! -d '/usbstorage' ]; then
		mkdir /usbstorage
		echo  "Directory /usbstorage created."
	fi

	mount /dev/${DEV}1 /usbstorage
	if test $? != '0'; then
		mount -t exfat /dev/${DEV}1 /usbstorage
		if test $? != '0'; then
			exit 2
		else
			exit 0
		fi
	else
		exit 0
	fi
else
	exit 1
fi
 
