#' @rdname DBI
#' @inheritParams DBI::dbDataType
#' @usage NULL
dbDataType_adbcDriver <- function(dbObj, obj, ...) {
  # Optional: Can remove this if all data types conform to SQL-92
  callNextMethod(...)
}
#' @rdname DBI
#' @export
setMethod("dbDataType", "adbcDriver", dbDataType_adbcDriver)
