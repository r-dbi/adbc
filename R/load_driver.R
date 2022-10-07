#' Load a driver
#'
#' TBD.
#'
#' @param connection A connection string of the form
#'   `"Driver=<path-to-library>;Entrypoint=<entrypoint-name>"`
#'
#' @export
#' @examples
#' try(load_driver("/path/to/foo.so))
load_driver <- function(connection, entrypoint = NULL) {
  cpp_load_driver(connection, entrypoint)
}
