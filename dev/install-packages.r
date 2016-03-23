if("devtools" %in% rownames(installed.packages()) == FALSE) {
    install.packages(c("devtools"), Sys.getenv("R_LIBS_USER"), repos='http://cran.us.r-project.org')
}
library("devtools")
devtools::install_github("oubiwann/lcmap-client-r")
