#' @rdname DBI
#' @inheritParams methods::show
#' @usage NULL
show_adbcConnection <- function(object) {
  cat("<adbcConnection>\n")
  # TODO: Print more details
}
#' @rdname DBI
#' @export
setMethod("show", "adbcConnection", show_adbcConnection)
