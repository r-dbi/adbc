#' @rdname DBI
#' @inheritParams DBI::dbHasCompleted
#' @usage NULL
dbHasCompleted_adbcResult <- function(res, ...) {
  testthat::skip("Not yet implemented: dbHasCompleted(Result)")
}
#' @rdname DBI
#' @export
setMethod("dbHasCompleted", "adbcResult", dbHasCompleted_adbcResult)
