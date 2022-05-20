#' Load a driver
#'
#' TBD.
#'
#' @param connection A connection string of the form
#'   `"Driver=<path-to-library>;Entrypoint=<entrypoint-name>"`
#'
#' @export
#' @examples
#' try(load_driver("Driver=foo.so;Entrypoint=init_foo"))
load_driver <- function(connection) {
  cpp_load_driver(connection)
}
