#' @rdname DBI
#' @inheritParams DBI::dbGetRowCount
#' @usage NULL
dbGetRowCount_adbcResult <- function(res, ...) {
  testthat::skip("Not yet implemented: dbGetRowCount(Result)")
}
#' @rdname DBI
#' @export
setMethod("dbGetRowCount", "adbcResult", dbGetRowCount_adbcResult)
