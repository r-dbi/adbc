#' @include Connection.R
NULL

adbcResult <- function(connection, statement) {
  # TODO: Initialize result
  new("adbcResult", connection = connection, statement = statement)
}

#' @rdname DBI
#' @export
setClass(
  "adbcResult",
  contains = "DBIResult",
  slots = list(
    connection = "adbcConnection",
    statement = "character"
  )
)
