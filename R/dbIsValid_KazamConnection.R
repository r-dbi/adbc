#' @rdname DBI
#' @inheritParams DBI::dbIsValid
#' @usage NULL
dbIsValid_adbcConnection <- function(dbObj, ...) {
  # TODO: Implement
  TRUE
}
#' @rdname DBI
#' @export
setMethod("dbIsValid", "adbcConnection", dbIsValid_adbcConnection)
