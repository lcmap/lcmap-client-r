PROJECT = lcmap
CHECK_SUGGESTS = FALSE

deps:
	Rscript dev/install-deps.r

check:
	cd ../ && _R_CHECK_FORCE_SUGGESTS_=$(CHECK_SUGGESTS) R CMD check $(PROJECT)

local-install:
	Rscript -e 'devtools::install_local("../lcmap")'

docs:
	Rscript -e 'roxygen2::roxygenise()'
