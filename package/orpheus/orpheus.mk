################################################################################
#
################################################################################

ORPHEUS_VERSION = 1.0
ORPHEUS_SOURCE = orpheus-$(ORPHEUS_VERSION).tar.gz
ORPHEUS_SITE = file://$(BR2_EXTERNAL_GVARDMAN_PATH)/board/gvardman/orpheus

define ORPHEUS_BUILD_CMDS
	echo build
endef

$(eval $(generic-package))
