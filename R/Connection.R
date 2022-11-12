#' @include Driver.R
NULL

adbcConnection <- function(connection_id) {
  new("adbcConnection", connection_id = connection_id)
}

#' @rdname DBI
#' @export
setClass(
  "adbcConnection",
  contains = "DBIConnection",
  slots = list(
    connection_id = "integer"
  )
)

#' @export
DBI::dbIsReadOnly

#' @export
DBI::dbQuoteLiteral

#' @export
DBI::dbUnquoteIdentifier

#' @export
DBI::dbGetQuery

#' @export
DBI::dbExecute

#' @export
DBI::dbReadTable

#' @export
DBI::dbCreateTable

#' @export
DBI::dbAppendTable

#' @export
DBI::dbListObjects

#' @export
DBI::dbWithTransaction
