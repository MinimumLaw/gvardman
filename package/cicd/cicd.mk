#
#
#

CICD_VERSION	= origin/dev
CICD_SITE	=ssh://git@gitlab-redguard.web.lan:2222/Lyamaev.Dmitriy/test_ci-cd.git
CICD_SITE_METHOD=git

$(eval $(cmake-package))