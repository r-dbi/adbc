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
#' @inheritParams load_driver
#' @examples
#' \dontrun{
#' #' library(DBI)
#' adbc::adbc()
#' }
adbc <- function(path, entrypoint = NULL) {
  driver_id <- load_driver(path, entrypoint)
  new("adbcDriver", driver_id = driver_id)
}

#' @export
#' @rdname adbc
from_radbc <- function(radbc) {
  stopifnot(inherits(radbc, "radbc_xptr"))
  driver_id <- cpp_use_radbc_driver(radbc)
  new("adbcDriver", driver_id = driver_id)
}

#' @rdname DBI
#' @export
setClass(
  "adbcDriver",
  contains = "DBIDriver",
  slots = list(
    driver_id = "integer"
  )
)

#' @export
DBI::dbCanConnect

#' @export
DBI::Id
