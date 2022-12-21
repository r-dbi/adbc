#' @include Connection.R
NULL

adbcResultArrow <- function(connection, statement, need_clear,
                            record_batch_reader = NULL,
                            rows_affected = NULL) {
  new("adbcResultArrow",
    connection = connection,
    statement = statement,
    need_clear = need_clear,
    record_batch_reader = record_batch_reader,
    rows_affected = rows_affected
  )
}

#' @rdname DBI
#' @export
setClass(
  "adbcResultArrow",
  contains = "DBIResultArrow",
  slots = list(
    connection = "adbcConnection",
    statement = "character",
    need_clear = "logical",
    record_batch_reader = "ANY",
    rows_affected = "ANY"
  )
)
