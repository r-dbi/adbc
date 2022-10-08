#' @rdname DBI
#' @inheritParams DBI::dbSendStatement
#' @usage NULL
dbSendStatement_adbcConnection_character <- function(conn, statement, ...) {
  rows_affected <- cpp_send_statement(conn@connection_id, statement)

  adbcResult(connection = conn, statement = statement, need_clear = FALSE, rows_affected = rows_affected)
}
#' @rdname DBI
#' @export
setMethod("dbSendStatement", c("adbcConnection", "character"), dbSendStatement_adbcConnection_character)
