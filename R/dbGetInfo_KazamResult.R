#' @rdname DBI
#' @inheritParams DBI::dbGetInfo
#' @usage NULL
dbGetInfo_adbcResult <- function(dbObj, ...) {
  # Optional
  getMethod("dbGetInfo", "DBIResult", asNamespace("DBI"))(dbObj, ...)
}
#' @rdname DBI
#' @export
setMethod("dbGetInfo", "adbcResult", dbGetInfo_adbcResult)
