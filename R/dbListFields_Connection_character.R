#' @rdname DBI
#' @inheritParams DBI::dbListFields
#' @usage NULL
dbListFields_adbcConnection_character <- function(conn, name, ...) {
  testthat::skip("Not yet implemented: dbListFields(Connection, character)")
}
#' @rdname DBI
#' @export
setMethod("dbListFields", c("adbcConnection", "character"), dbListFields_adbcConnection_character)
