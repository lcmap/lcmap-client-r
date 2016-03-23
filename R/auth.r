#' Authenticate to LCMAP using ERS
#'
#' @param username username
#' @param password password
#' @export
#' @family config
#' @examples
#' GET("http://httpbin.org/basic-auth/user/passwd")
#' GET("http://httpbin.org/basic-auth/user/passwd",
#'   authenticate("alice", "secret"))
auth <- function(user, password) {
  stopifnot(is.character(user), length(user) == 1)
  stopifnot(is.character(password), length(password) == 1)
  stopifnot(is.character(type), length(type) == 1)
}
