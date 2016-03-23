PROJECT = lcmap

deps:
	R CMD INSTALL devtools

check:
	cd ../ && _R_CHECK_FORCE_SUGGESTS_=0 R CMD check $(PROJECT)

