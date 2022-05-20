#' @rdname DBI
#' @inheritParams DBI::dbBegin
#' @usage NULL
dbBegin_adbcConnection <- function(conn, ...) {
  testthat::skip("Not yet implemented: dbBegin(Connection)")
}
#' @rdname DBI
#' @export
setMethod("dbBegin", "adbcConnection", dbBegin_adbcConnection)
