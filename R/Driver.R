#' @include adbc-package.R
NULL

#' DBI methods
#'
#' Implementations of pure virtual functions defined in the `DBI` package.
#' @name DBI
NULL

#' adbc driver
#'
#' TBD.
#'
#' @export
#' @import methods DBI
#' @examples
#' \dontrun{
#' #' library(DBI)
#' adbc::adbc()
#' }
adbc <- function() {
  new("adbcDriver")
}

#' @rdname DBI
#' @export
setClass("adbcDriver", contains = "DBIDriver")

#' @export
DBI::dbCanConnect

#' @export
DBI::Id
