#' @rdname DBI
#' @inheritParams DBI::dbGetInfo
#' @usage NULL
dbGetInfo_adbcDriver <- function(dbObj, ...) {
  list(
    driver.version = parent.env(environment())$.__NAMESPACE__.$spec[["version"]],
    # FIXME: Update when ADBC updates
    client.version = "1.0.0"
  )
}
#' @rdname DBI
#' @export
setMethod("dbGetInfo", "adbcDriver", dbGetInfo_adbcDriver)
