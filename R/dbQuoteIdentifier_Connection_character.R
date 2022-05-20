#' @rdname DBI
#' @inheritParams DBI::dbQuoteIdentifier
#' @usage NULL
dbQuoteIdentifier_adbcConnection_character <- function(conn, x, ...) {
  # Optional
  getMethod("dbQuoteIdentifier", c("DBIConnection", "character"), asNamespace("DBI"))(conn, x, ...)
}
#' @rdname DBI
#' @export
setMethod("dbQuoteIdentifier", c("adbcConnection", "character"), dbQuoteIdentifier_adbcConnection_character)
