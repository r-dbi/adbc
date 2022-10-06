#' @rdname DBI
#' @inheritParams DBI::dbDataType
#' @usage NULL
dbDataType_adbcDriver_list <- function(dbObj, obj, ...) {
  # https://github.com/r-dbi/DBI/issues/70
  callNextMethod(...)
}
#' @rdname DBI
#' @export
setMethod("dbDataType", c("adbcDriver", "list"), dbDataType_adbcDriver_list)
