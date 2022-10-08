#' @rdname DBI
#' @inheritParams DBI::dbClearResult
#' @usage NULL
dbClearResult_adbcResult <- function(res, ...) {
  if (res@need_clear) {
    cpp_clear_result(res@connection@connection_id)
  }

  invisible(TRUE)
}
#' @rdname DBI
#' @export
setMethod("dbClearResult", "adbcResult", dbClearResult_adbcResult)
