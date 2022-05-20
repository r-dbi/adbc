#' @rdname DBI
#' @inheritParams DBI::dbGetStatement
#' @usage NULL
dbGetStatement_adbcResult <- function(res, ...) {
  testthat::skip("Not yet implemented: dbGetStatement(Result)")
}
#' @rdname DBI
#' @export
setMethod("dbGetStatement", "adbcResult", dbGetStatement_adbcResult)
