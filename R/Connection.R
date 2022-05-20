#' @include Driver.R
NULL

adbcConnection <- function() {
  # TODO: Add arguments
  new("adbcConnection")
}

#' @rdname DBI
#' @export
setClass(
  "adbcConnection",
  contains = "DBIConnection",
  slots = list()
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
DBI::dbCreateTable

#' @export
DBI::dbAppendTable

#' @export
DBI::dbListObjects

#' @export
DBI::dbWithTransaction
