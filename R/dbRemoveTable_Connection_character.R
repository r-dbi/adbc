#' @rdname DBI
#' @inheritParams DBI::dbRemoveTable
#' @usage NULL
dbRemoveTable_adbcConnection_character <- function(conn, name, ...,
                                                   temporary = FALSE, fail_if_missing = TRUE) {
  name <- dbQuoteIdentifier(conn, name)

  sql <- paste0(
    "DROP ",
    if (temporary) "TEMPORARY ",
    "TABLE ",
    if (!fail_if_missing) "IF EXISTS ",
    name
  )

  dbExecute(conn, sql)

  TRUE
}
#' @rdname DBI
#' @export
setMethod("dbRemoveTable", c("adbcConnection", "character"), dbRemoveTable_adbcConnection_character)
