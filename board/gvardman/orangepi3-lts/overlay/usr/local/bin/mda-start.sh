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

# restore alsa mixer settings
/usr/sbin/alsactl -U restore

# first - kill all already runing copy
killall mda 

# next - start new copy of software
/usr/local/bin/mda 2>&1 >/dev/null&

# Let's BOTH red and green leds show MDA running
/bin/echo 1 > /sys/class/leds/red-led/brightness
