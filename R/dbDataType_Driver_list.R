#' @rdname DBI
#' @inheritParams DBI::dbDataType
#' @usage NULL
dbDataType_adbcDriver_list <- function(dbObj, obj, ...) {
  # rstats-db/DBI#70
  testthat::skip("Not yet implemented: dbDataType(Driver, list)")
}
#' @rdname DBI
#' @export
setMethod("dbDataType", c("adbcDriver", "list"), dbDataType_adbcDriver_list)
