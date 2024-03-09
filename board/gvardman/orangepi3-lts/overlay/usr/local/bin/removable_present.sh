#!/bin/sh

for block_dev in /sys/block/sd?; do
	if [ -e "$block_dev" ]; then
		if test `cat $block_dev/removable` = '1'; then
			exit 1
		fi
	fi
done

exit 0

