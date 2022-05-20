#' @rdname DBI
#' @inheritParams DBI::dbConnect
#' @usage NULL
dbConnect_adbcDriver <- function(drv, ...) {
  # TODO: Implement
  adbcConnection()
}
#' @rdname DBI
#' @export
setMethod("dbConnect", "adbcDriver", dbConnect_adbcDriver)
