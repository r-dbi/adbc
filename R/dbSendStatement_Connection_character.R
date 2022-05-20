#' @rdname DBI
#' @inheritParams DBI::dbSendStatement
#' @usage NULL
dbSendStatement_adbcConnection_character <- function(conn, statement, ...) {
  # TODO: Implement, remove skip() call
  testthat::skip("Not sending statement")
  adbcResult(connection = conn, statement = statement)
}
#' @rdname DBI
#' @export
setMethod("dbSendStatement", c("adbcConnection", "character"), dbSendStatement_adbcConnection_character)
