#' @rdname DBI
#' @inheritParams DBI::dbClearResult
#' @usage NULL
dbClearResult_adbcResultStream <- function(res, ...) {
  dbClearResult_adbcResult(res)
}
#' @rdname DBI
#' @export
setMethod("dbClearResult", "adbcResultStream", dbClearResult_adbcResultStream)
