#' Authenticate to LCMAP using ERS
#'
#' @param username username
#' @param password password
#' @param version version
#' @export
#' @examples
#' login("alice", "secret")
#' login("alice", "secret", "2.0")
login <- function (username, password, version) {
    if (missing(version)) {
        version<-lcmap::defaultAPIVersion
    }
    cfg<-lcmap::getCfg()
    payload<-list(username=cfg$username, password=cfg$password)
    result<-lcmap::post(lcmap::routes$loginContext, version, body=payload, encode="form")
    return(result)
}
