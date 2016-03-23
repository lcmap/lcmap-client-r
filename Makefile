PROJECT = lcmap
CHECK_SUGGESTS = FALSE

deps:
	Rscript dev/install-deps.r

check:
	cd ../ && _R_CHECK_FORCE_SUGGESTS_=$(CHECK_SUGGESTS) R CMD check $(PROJECT)

local-install:
	Rscript dev/install-client.r
