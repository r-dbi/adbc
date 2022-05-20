#' @rdname DBI
#' @inheritParams DBI::dbGetInfo
#' @usage NULL
dbGetInfo_adbcDriver <- function(dbObj, ...) {
  testthat::skip("Not yet implemented: dbGetInfo(Driver)")
}
#' @rdname DBI
#' @export
setMethod("dbGetInfo", "adbcDriver", dbGetInfo_adbcDriver)
