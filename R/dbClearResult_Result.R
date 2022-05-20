#' @rdname DBI
#' @inheritParams DBI::dbClearResult
#' @usage NULL
dbClearResult_adbcResult <- function(res, ...) {
  testthat::skip("Not yet implemented: dbClearResult(Result)")
}
#' @rdname DBI
#' @export
setMethod("dbClearResult", "adbcResult", dbClearResult_adbcResult)
