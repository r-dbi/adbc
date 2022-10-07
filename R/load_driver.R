#' Load a driver
#'
#' TBD.
#'
#' @param path Path to the shared library
#' @param entrypoint The name of the ADBC entry point,
#'   by default `"AdbcDriverInit"` is used.
#'
#' @export
#' @examples
#' try(load_driver("/path/to/foo.so"))
#' try(load_driver("/path/to/foo.so", "foo_adbc_init"))
load_driver <- function(path, entrypoint = NULL) {
  path <- normalizePath(path, mustWork = TRUE)
  if (is.null(entrypoint)) {
    entrypoint <- ""
  }
  cpp_load_driver(path, entrypoint)
}
