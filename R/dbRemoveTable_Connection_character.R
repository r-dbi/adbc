#' @rdname DBI
#' @inheritParams DBI::dbRemoveTable
#' @usage NULL
dbRemoveTable_adbcConnection_character <- function(conn, name, ...) {
  callNextMethod(...)
}
#' @rdname DBI
#' @export
setMethod("dbRemoveTable", c("adbcConnection", "character"), dbRemoveTable_adbcConnection_character)
