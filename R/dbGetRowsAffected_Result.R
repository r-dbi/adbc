#' @rdname DBI
#' @inheritParams DBI::dbGetRowsAffected
#' @usage NULL
dbGetRowsAffected_adbcResult <- function(res, ...) {
  res@rows_affected
}
#' @rdname DBI
#' @export
setMethod("dbGetRowsAffected", "adbcResult", dbGetRowsAffected_adbcResult)
