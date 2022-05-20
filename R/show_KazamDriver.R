#' @rdname DBI
#' @inheritParams methods::show
#' @usage NULL
show_adbcDriver <- function(object) {
  cat("<adbcDriver>\n")
  # TODO: Print more details
}
#' @rdname DBI
#' @export
setMethod("show", "adbcDriver", show_adbcDriver)
