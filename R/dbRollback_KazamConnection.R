#' @rdname DBI
#' @inheritParams DBI::dbRollback
#' @usage NULL
dbRollback_adbcConnection <- function(conn, ...) {
  testthat::skip("Not yet implemented: dbRollback(Connection)")
}
#' @rdname DBI
#' @export
setMethod("dbRollback", "adbcConnection", dbRollback_adbcConnection)
