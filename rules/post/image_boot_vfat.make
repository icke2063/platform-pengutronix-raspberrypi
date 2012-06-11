# -*-makefile-*-
#
# Copyright (C) 2011 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

RPI_FIRMWARE_DIR := $(PTXDIST_PLATFORMCONFIGDIR)/firmware

RPI_FIRMWARE := $(wildcard $(RPI_FIRMWARE_DIR)/*.bin $(RPI_FIRMWARE_DIR)/*.elf)

$(IMAGEDIR)/boot.vfat.map: $(PTXDIST_PLATFORMCONFIGDIR)/rules/post/image_boot_vfat.make
	@echo "$(IMAGEDIR)/kernel.img"					>  "$@"
	@$(foreach firmware, $(RPI_FIRMWARE), echo "$(firmware)"	>> "$@";)
	@echo "$(PTXDIST_PLATFORMCONFIGDIR)/config.txt"			>> "$@"
	@echo "$(PTXDIST_PLATFORMCONFIGDIR)/cmdline.txt"		>> "$@"

$(IMAGEDIR)/boot.vfat: $(PTXDIST_PLATFORMCONFIGDIR)/config.txt
$(IMAGEDIR)/boot.vfat: $(IMAGEDIR)/kernel.img

# 10MiB
boot_VFAT_SIZE := 20971520

ifdef PTXCONF_IMAGE_BOOT_VFAT
images: $(IMAGEDIR)/boot.vfat
endif

