#' @include Connection.R
NULL

adbcResult <- function(connection, statement, record_batch_reader) {
  new("adbcResult", connection = connection, statement = statement, record_batch_reader = record_batch_reader)
}

#' @rdname DBI
#' @export
setClass(
  "adbcResult",
  contains = "DBIResult",
  slots = list(
    connection = "adbcConnection",
    statement = "character",
    record_batch_reader = "ANY"
  )
)
