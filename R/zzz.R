.onLoad <- function(...) {
  vctrs::s3_register("dbplyr::dbplyr_edition", "adbcConnection")
}
