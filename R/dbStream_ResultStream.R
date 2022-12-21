#' @rdname DBI
#' @inheritParams DBI::dbFetch
#' @usage NULL
dbFetchArrow_adbcResultArrow <- function(res, ...) {
  res@record_batch_reader
}
#' @rdname DBI
#' @export
setMethod("dbFetchArrow", "adbcResultArrow", dbFetchArrow_adbcResultArrow)
