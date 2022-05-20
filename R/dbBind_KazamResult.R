#' @rdname DBI
#' @inheritParams DBI::dbBind
#' @usage NULL
dbBind_adbcResult <- function(res, params, ...) {
  testthat::skip("Not yet implemented: dbBind(Result)")
}
#' @rdname DBI
#' @export
setMethod("dbBind", "adbcResult", dbBind_adbcResult)
