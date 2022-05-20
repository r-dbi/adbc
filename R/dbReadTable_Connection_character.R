#' @rdname DBI
#' @inheritParams DBI::dbReadTable
#' @usage NULL
dbReadTable_adbcConnection_character <- function(conn, name, ...) {
  testthat::skip("Not yet implemented: dbReadTable(Connection, character)")
}
#' @rdname DBI
#' @export
setMethod("dbReadTable", c("adbcConnection", "character"), dbReadTable_adbcConnection_character)
