#' @rdname DBI
#' @inheritParams DBI::dbListTables
#' @usage NULL
dbListTables_adbcConnection <- function(conn, ...) {
  testthat::skip("Not yet implemented: dbListTables(Connection)")
}
#' @rdname DBI
#' @export
setMethod("dbListTables", "adbcConnection", dbListTables_adbcConnection)
