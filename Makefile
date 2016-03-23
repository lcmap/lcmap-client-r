PROJECT = lcmap
_R_CHECK_FORCE_SUGGESTS_ = 0

deps:
	Rscript dev/install-packages.r

check:
	cd ../ && R CMD check $(PROJECT)

local-install:
	cd ../ && R CMD install -d $(PROJECT)
