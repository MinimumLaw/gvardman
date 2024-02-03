#!/bin/sh
##############################################################################
##############################################################################
##############################################################################

echo '############################################'
echo '# replace /usr/local/bin/gvardman-start.sh #'
echo '# in  board/gvardman/orengepi3_lts/overlay #'
echo '# buildroot external  directory to startup #'
echo '#          script  for  you  code          #'
echo '############################################'

# Just run "yes" as daemon
/usr/bin/yes > /dev/null&