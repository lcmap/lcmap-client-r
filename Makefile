PROJECT = lcmap
CHECK_SUGGESTS = FALSE

deps:
	Rscript dev/install-deps.r

local-install:
	Rscript -e 'devtools::install_local("../$(PROJECT)")'

docs:
	Rscript -e 'roxygen2::roxygenise()'

check: docs
	cd ../ && _R_CHECK_FORCE_SUGGESTS_=$(CHECK_SUGGESTS) R CMD check $(PROJECT)

