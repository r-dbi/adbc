#' @rdname DBI
#' @inheritParams DBI::dbIsValid
#' @usage NULL
dbIsValid_adbcDriver <- function(dbObj, ...) {
  testthat::skip("Not yet implemented: dbIsValid(Driver)")
}
#' @rdname DBI
#' @export
setMethod("dbIsValid", "adbcDriver", dbIsValid_adbcDriver)
