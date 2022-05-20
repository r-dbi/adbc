#' @rdname DBI
#' @inheritParams DBI::dbGetRowsAffected
#' @usage NULL
dbGetRowsAffected_adbcResult <- function(res, ...) {
  testthat::skip("Not yet implemented: dbGetRowsAffected(Result)")
}
#' @rdname DBI
#' @export
setMethod("dbGetRowsAffected", "adbcResult", dbGetRowsAffected_adbcResult)
