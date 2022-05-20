#' @rdname DBI
#' @inheritParams DBI::dbRemoveTable
#' @usage NULL
dbRemoveTable_adbcConnection_character <- function(conn, name, ...) {
  testthat::skip("Not yet implemented: dbRemoveTable(Connection, character)")
}
#' @rdname DBI
#' @export
setMethod("dbRemoveTable", c("adbcConnection", "character"), dbRemoveTable_adbcConnection_character)
