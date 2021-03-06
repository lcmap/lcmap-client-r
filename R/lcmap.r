#' \pkg{lcmap} R client for LCMAP REST services
#'
#' @name lcmap
#' @docType package

#' @export
clientVersion<-"0.0.0.9000"

#' @export
defaultAPIVersion<-"0.0"

#' @export
routes<-hash::hash(baseContext="/api",
                   authContext="/api/auth",
                   loginContext="/api/auth/login",
                   userContext="/api/auth/me",
                   compatContext="/api/compatibility",
                   dataContext="/api/data",
                   jobsContext="/api/jobs",
                   modelsContext="/api/models",
                   eventsContext="/api/events",
                   systemContext="/api/system",
                   jsonStatusContext="/api/system/json-status",
                   xmlStatysContext="/api/system/status",
                   usersContext="/api/users")
