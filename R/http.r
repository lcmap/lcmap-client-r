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
#' @param version version
#' @param contentType contentType
#' @export
#' @examples
#' formatAccept("2.0", "text/xml")
formatAccept <- function(version, contentType) {
    if (missing(contentType)) {
        mediaType<-c(mediaTypePrefix, mediaTypeSuffix)
    } else {
        mediaType<-strsplit(contentType, "/")[[1]]
    }
    accept<-sprintf("%s/%s.v%s+%s", mediaType[1], clientVendor, version,
                    mediaType[2])
    return(accept)
}

parseResult <- function(contentType, result) {
    # XXX as soon as content-type is set properly by the server, the client
    #     will be able to disaptch the appropriate parser
    return(jsonlite::fromJSON(result))
}

#' @export
request <- function(method, path, version, ...) {
    url<-sprintf("%s%s", getCfg()$endpoint, path)
    func<-getFromNamespace(method, "httr")
    args<-list(url, httr::add_headers("User-Agent"=lcmap::formatUserAgent(),
                                      "Accept"=lcmap::formatAccept(version)),
               ...)
    response<-do.call(func, args)
    textResult<-httr::content(response, as="text")
    contentType<-httr::headers(response)$`content-type`
    return(parseResult(contentType, textResult))
}

#' @export
get <- function(path, version, ...) {
    request("GET", path, version, ...)
}

#' @export
post <- function(path, version, ...) {
    request("POST", path, version, ...)
}

#' @export
put <- function(path, version, ...) {
    request("PUT", path, version, ...)
}

#' @export
delete <- function(path, version, ...) {
    request("DELETE", path, version, ...)
}
