#!/bin/sh
##############################################################################
##############################################################################
###                                                                        ###
###                        Let's start MDA software                        ###
###                                                                        ###
##############################################################################
##############################################################################

# first - kill all already runing copy
killall mda 
# next - start new copy of software
/usr/local/bin/mda 2>&1 >/dev/null&