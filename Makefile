PROJECT = lcmap

deps:
	Rscript dev/install-packages.r

check:
	cd ../ && _R_CHECK_FORCE_SUGGESTS_=0 R CMD check $(PROJECT)

