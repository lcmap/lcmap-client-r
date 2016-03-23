defaultEndpoint = "http://"
clientVendor = "vnd.usgs.lcmap"
projectUrl = "https://github.com/oubiwann/lcmap-client-r"
mediaTypePrefix = "application"
mediaTypeSuffix = "json"

#' Format the client user agent string
#'
#' @export
#' @examples
#' formatUserAgent()
formatUserAgent <- function() {
    userAgent<-sprintf("LCMAP REST Client/%s (%s) (+%s)",
        lcmap::clientVersion, version$version.string, projectUrl)
    return(userAgent)
}

#' Format the data for the 'Accept' header
#'
#' @param vendor vendor
#' @param version version
#' @param contentType contentType
#' @export
#' @examples
#' formatAccept("vnd.some.one", "2.0", "text/xml")
formatAccept <- function(version, contentType) {
    if (missing(contentType)) {
        mediaType<-c(mediaTypePrefix, mediaTypeSuffix)
    } else {
        mediaType<-strsplit(contentType, "/")[[1]]
    }
    accept<-sprintf("%s/%s.v%s+%s", mediaType[1], clientVendor, version, mediaType[2])
    return(accept)
}

request <- function(method, path, ...) {
    func<-sprintf("httr::%s", method)
    url<-sprintf("%s%s", getCfg$endpoint, path)
    do.call(func, list(url, ...))
}

get <- function(path, ...) {
    request("GET", path, ...)
}

post <- function(path, ...) {
    request("POST", path, ...)
}

put <- function(path, ...) {
    request("PUT", path, ...)
}

delete <- function(path, ...) {
    request("DELETE", path, ...)
}
