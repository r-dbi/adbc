#' @rdname DBI
#' @inheritParams DBI::dbFetch
#' @usage NULL
dbFetch_adbcResult <- function(res, n = -1, ...) {
  stopifnot(n == -1)
  as.data.frame(as.data.frame(res@record_batch_reader))
}
#' @rdname DBI
#' @export
setMethod("dbFetch", "adbcResult", dbFetch_adbcResult)
