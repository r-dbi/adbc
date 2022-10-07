#' @rdname DBI
#' @inheritParams DBI::dbConnect
#' @usage NULL
dbConnect_adbcDriver <- function(drv, ...) {
  connection_id <- cpp_connect(drv@driver_id)
  adbcConnection(connection_id)
}
#' @rdname DBI
#' @export
setMethod("dbConnect", "adbcDriver", dbConnect_adbcDriver)
