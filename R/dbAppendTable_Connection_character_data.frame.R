dbAppendTable_adbcConnection <- function(conn, name, value, ..., row.names = NULL) {
  # FIXME: Remove when parameterized binding is implemented

  if (!is.null(row.names)) {
    stop("Can't pass `row.names` to `dbAppendTable()`", call. = FALSE)
  }
  stopifnot(is.data.frame(value))

  query <- sqlAppendTable(
    con = conn,
    table = name,
    values = value,
    row.names = row.names,
    ...
  )
  dbExecute(conn, query)
}
#' @export
setMethod("dbAppendTable", signature("adbcConnection"), dbAppendTable_adbcConnection)
