PROJECT = lcmap
CHECK_SUGGESTS = FALSE

deps:
	Rscript dev/install-deps.r

local-install:
	Rscript -e 'devtools::install_local("../$(PROJECT)")'

docs:
	Rscript -e 'roxygen2::roxygenise()'
	# XXX this next command is breaking due to LaTeX errors
	#R CMD Rd2pdf man
	# XXX this next command is breaking due to missing metadata in the docs
	#R CMD Rd2txt man

check: docs
	cd ../ && _R_CHECK_FORCE_SUGGESTS_=$(CHECK_SUGGESTS) R CMD check $(PROJECT)

