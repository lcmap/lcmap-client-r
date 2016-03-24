system.getJSONStatus <- function (version) {
    if (missing(version)) {
        version<-lcmap::defaultAPIVersion
    }
    lcmap::get(lcmap::routes$jsonStatusContext, version)
}

system.getXMLStatus <- function (version) {
    if (missing(version)) {
        version<-lcmap::defaultAPIVersion
    }
    lcmap::get(lcmap::routes$xmlStatusContext, version)
}
