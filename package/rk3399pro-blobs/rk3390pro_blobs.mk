################################################################################
#
################################################################################

RK3399PRO_BLOBS_VERSION = master
RK3399PRO_BLOBS_SITE = $(call github,rockchip-linux,rkbin,$(RK3399PRO_BLOBS_VERSION))
RK3399PRO_BLOBS_DEPEND = \
	BR2_TARGET_UBOOT
RK3399PRO_BLOBS_INSTALL_IMAGES = YES


define RK3399PRO_BLOBS_BUILD_CMDS
pushd $(@D); \
	./tools/mkimage \
		-n rk3399 \
		-T rksd \
		-d ./bin/rk33/rk3399pro_ddr_800MHz_v1.27.bin:./bin/rk33/rk3399pro_miniloader_v1.26.bin \
		bootloader.img; \
	./tools/trust_merger \
		RKTRUST/RK3399PROTRUST.ini; \
	./tools/loaderimage \
		--pack \
		--uboot ./../uboot-2022.04/u-boot-dtb.bin \
		uboot.img 0x200000; \
popd
endef


define RK3399PRO_BLOBS_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0666 $(@D)/trust.img $(BINARIES_DIR)
	$(INSTALL) -D -m 0666 $(@D)/uboot.img $(BINARIES_DIR)
	$(INSTALL) -D -m 0666 $(@D)/bootloader.img $(BINARIES_DIR)
endef

$(eval $(generic-package))
