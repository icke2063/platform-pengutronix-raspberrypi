# -*-makefile-*-
#
# Copyright (C) 2011 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

$(IMAGEDIR)/kernel.img: $(IMAGEDIR)/linuximage
	cat $(PTXDIST_PLATFORMCONFIGDIR)/first32k.bin $< > $@

