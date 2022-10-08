#' @rdname DBI
#' @inheritParams DBI::dbDataType
#' @usage NULL
dbDataType_adbcConnection <- function(dbObj, obj, ...) {
  callNextMethod(...)
}
#' @rdname DBI
#' @export
setMethod("dbDataType", "adbcConnection", dbDataType_adbcConnection)
