#' @rdname DBI
#' @inheritParams DBI::dbDisconnect
#' @usage NULL
dbDisconnect_adbcConnection <- function(conn, ...) {
  if (!dbIsValid(conn)) {
    warning("Connection already closed.", call. = FALSE)
  }

  cpp_disconnect(conn@connection_id)

  invisible(TRUE)
}
#' @rdname DBI
#' @export
setMethod("dbDisconnect", "adbcConnection", dbDisconnect_adbcConnection)
