#' @rdname DBI
#' @inheritParams DBI::dbSendQuery
#' @usage NULL
dbSendQueryArrow_adbcConnection <- function(conn, statement, ..., params = NULL) {
  if (!is.null(params)) {
    testthat::skip("Not yet implemented: dbSendQuery(params = )")
  }

  record_batch_reader <- cpp_send_query(conn@connection_id, statement)

  adbcResultArrow(connection = conn, statement = statement, need_clear = TRUE, record_batch_reader = record_batch_reader)
}
#' @rdname DBI
#' @export
setMethod("dbSendQueryArrow", "adbcConnection", dbSendQueryArrow_adbcConnection)
