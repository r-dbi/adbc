#' @rdname DBI
#' @inheritParams DBI::dbGetInfo
#' @usage NULL
dbGetInfo_adbcConnection <- function(dbObj, ...) {
  testthat::skip("Not yet implemented: dbGetInfo(Connection)")
}
#' @rdname DBI
#' @export
setMethod("dbGetInfo", "adbcConnection", dbGetInfo_adbcConnection)
