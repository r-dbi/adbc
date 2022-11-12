#' @rdname DBI
#' @inheritParams DBI::dbFetch
#' @usage NULL
dbStream_adbcResultStream <- function(res, ...) {
  res@record_batch_reader
}
#' @rdname DBI
#' @export
setMethod("dbStream", "adbcResultStream", dbStream_adbcResultStream)
