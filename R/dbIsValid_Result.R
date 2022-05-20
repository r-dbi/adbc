#' @rdname DBI
#' @inheritParams DBI::dbIsValid
#' @usage NULL
dbIsValid_adbcResult <- function(dbObj, ...) {
  testthat::skip("Not yet implemented: dbIsValid(Result)")
}
#' @rdname DBI
#' @export
setMethod("dbIsValid", "adbcResult", dbIsValid_adbcResult)
