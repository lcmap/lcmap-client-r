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
    if missing(version) {
        version<-lcmap::defaultAPIVersion
    }
    result<-lcmap::get(lcmap::routes$loginContext,
                       httr::add_header("User-Agent", lcmap::formatUserAgent()),
                       httr::add_header("Accept", lcmap::formatAccpt(version)))
    return(jsonlite::fromJSON(result))
}
