#' @rdname DBI
#' @inheritParams DBI::dbQuoteString
#' @usage NULL
dbQuoteString_adbcConnection_character <- function(conn, x, ...) {
  # Optional
  getMethod("dbQuoteString", c("DBIConnection", "character"), asNamespace("DBI"))(conn, x, ...)
}
#' @rdname DBI
#' @export
setMethod("dbQuoteString", c("adbcConnection", "character"), dbQuoteString_adbcConnection_character)
