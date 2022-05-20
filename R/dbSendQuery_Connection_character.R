#' @rdname DBI
#' @inheritParams DBI::dbSendQuery
#' @usage NULL
dbSendQuery_adbcConnection_character <- function(conn, statement, ...) {
  # TODO: Implement, remove skip() call
  testthat::skip("Not sending query")
  adbcResult(connection = conn, statement = statement)
}
#' @rdname DBI
#' @export
setMethod("dbSendQuery", c("adbcConnection", "character"), dbSendQuery_adbcConnection_character)
