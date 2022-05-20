#' @rdname DBI
#' @inheritParams methods::show
#' @usage NULL
show_adbcResult <- function(object) {
  cat("<adbcResult>\n")
  # TODO: Print more details
}
#' @rdname DBI
#' @export
setMethod("show", "adbcResult", show_adbcResult)
