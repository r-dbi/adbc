#' @rdname DBI
#' @inheritParams DBI::dbExistsTable
#' @usage NULL
dbExistsTable_adbcConnection_character <- function(conn, name, ...) {
  callNextMethod(...)
}
#' @rdname DBI
#' @export
setMethod("dbExistsTable", c("adbcConnection", "character"), dbExistsTable_adbcConnection_character)
