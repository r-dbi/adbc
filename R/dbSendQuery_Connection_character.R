#' @rdname DBI
#' @inheritParams DBI::dbSendQuery
#' @usage NULL
dbSendQuery_adbcConnection_character <- function(conn, statement, ...) {
  record_batch_reader <- cpp_send_query(conn@connection_id, statement)

  adbcResult(connection = conn, statement = statement, need_clear = TRUE, record_batch_reader = record_batch_reader)
}
#' @rdname DBI
#' @export
setMethod("dbSendQuery", c("adbcConnection", "character"), dbSendQuery_adbcConnection_character)
