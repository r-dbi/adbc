#' Load a driver
#'
#' TBD.
#'
#' @param connection A connection string of the form
#'   `"Driver=<path-to-library>"`
#'
#' @export
#' @examples
#' try(load_driver("foo.so"))
load_driver <- function(connection) {
  cpp_load_driver(connection)
}
