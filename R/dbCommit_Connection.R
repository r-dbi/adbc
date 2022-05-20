#' @rdname DBI
#' @inheritParams DBI::dbCommit
#' @usage NULL
dbCommit_adbcConnection <- function(conn, ...) {
  testthat::skip("Not yet implemented: dbCommit(Connection)")
}
#' @rdname DBI
#' @export
setMethod("dbCommit", "adbcConnection", dbCommit_adbcConnection)
