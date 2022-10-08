#' @rdname DBI
#' @inheritParams DBI::dbClearResult
#' @usage NULL
dbClearResult_adbcResult <- function(res, ...) {
  cpp_clear_result(res@connection@connection_id)
}
#' @rdname DBI
#' @export
setMethod("dbClearResult", "adbcResult", dbClearResult_adbcResult)
