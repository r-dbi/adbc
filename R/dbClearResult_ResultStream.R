#' @rdname DBI
#' @inheritParams DBI::dbClearResult
#' @usage NULL
dbClearResult_adbcResultArrow <- function(res, ...) {
  dbClearResult_adbcResult(res)
}
#' @rdname DBI
#' @export
setMethod("dbClearResult", "adbcResultArrow", dbClearResult_adbcResultArrow)
