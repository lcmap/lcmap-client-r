clientConfigFile<-"~/.usgs/lcmap.ini"
clientSection<-"LCMAP Client"

#' Read the LCMAP client configuration file
#'
#' @param filename filename
#' @param password password
#' @export
#' @family config
#' @examples
#' getIni()
#' getIni("custom/loc/lcmap.ini")
getIni<-function (filename) {
    if (missing(filename)) {
        filename<-clientConfigFile
    }
    iniData<-raster::readIniFile(filename)
    matches<-c(which(outer(iniData[,"section"], clientSection, "==")), arr.ind=TRUE)
    return(iniData[1:nrow(iniData) %in% matches, ])
}
