#' @rdname DBI
#' @inheritParams DBI::dbColumnInfo
#' @usage NULL
dbColumnInfo_adbcResult <- function(res, ...) {
  testthat::skip("Not yet implemented: dbColumnInfo(Result)")
}
#' @rdname DBI
#' @export
setMethod("dbColumnInfo", "adbcResult", dbColumnInfo_adbcResult)
