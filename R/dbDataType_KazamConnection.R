#' @rdname DBI
#' @inheritParams DBI::dbDataType
#' @usage NULL
dbDataType_adbcConnection <- function(dbObj, obj, ...) {
  tryCatch(
    getMethod("dbDataType", "DBIObject", asNamespace("DBI"))(dbObj, obj, ...),
    error = function(e) testthat::skip("Not yet implemented: dbDataType(Connection)")
  )
}
#' @rdname DBI
#' @export
setMethod("dbDataType", "adbcConnection", dbDataType_adbcConnection)
