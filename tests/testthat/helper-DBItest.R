if (is.null(DBItest::get_default_context())) {

DBItest::make_context(
  adbc(asNamespace("duckadbc")$.__NAMESPACE__.$DLLs$duckadbc[["path"]], "duckdb_adbc_init"),
  list(),
  tweaks = suppressWarnings(DBItest::tweaks(
    dbitest_version = "1.7.2",
    omit_blob_tests = FALSE,
    temporary_tables = FALSE,
    placeholder_pattern = "?",
    timestamp_cast = function(x) sprintf("CAST('%s' AS TIMESTAMP)", x),
    date_cast = function(x) sprintf("CAST('%s' AS DATE)", x),
    time_cast = function(x) sprintf("CAST('%s' AS TIME)", x),
    blob_cast = function(x) sprintf("%s::BLOB", x)
  )),
  name = "adbc",
  default_skip = c(
    "package_name",

    # Not applicable: the driver object is connected to a shared library
    "constructor",

    # TODO: Implicitly testing order of connect/disconnect
    "table_visible_in_other_connection",
    "create_table_visible_in_other_connection",
    "begin_write_disconnect",

    # TODO: bigint argument to dbConnect()
    "connect_bigint_integer",
    "connect_bigint_character",

    # TODO: segfault
    "fetch_zero_rows",

    # TODO: behavior
    "send_query_only_one_result_set",
    "send_query_stale_warning",
    "send_query_immediate",
    "send_query_params",
    "fetch_closed",
    "fetch_n_bad",
    "fetch_n_progressive",
    "fetch_n_multi_row_inf",
    "fetch_n_more_rows",
    "fetch_n_zero_rows",
    "fetch_n_premature_close",
    "clear_result_return_query",
    "cannot_clear_result_twice_query",
    "get_query_n_bad",
    "get_query_n_multi_row_inf",
    "get_query_n_more_rows",
    "get_query_n_zero_rows",
    "get_query_n_incomplete",
    "get_query_params",
    "fetch_no_return_value",
    "cannot_clear_result_twice_statement",
    "send_statement_stale_warning",
    "send_statement_only_one_result_set",
    "data_logical",
    "exists_table_closed_connection",
    "exists_table_invalid_connection",
    "bind_.*",
    "rows_affected_query",
    "get_rows_affected_error",
    "has_completed_query_spec",
    "has_completed_query_spec_partial",
    "append_roundtrip_timestamp",
    "roundtrip_timestamp",
    "append_roundtrip_timestamp_extended",
    "roundtrip_timestamp_extended",
    "exists_table_error",
    "append_table_new",
    "rows_affected_statement",
    "roundtrip_blob",
    "roundtrip_raw",
    "roundtrip_64_bit_roundtrip",
    "roundtrip_logical",
    "append_roundtrip_blob",
    "append_roundtrip_raw",
    "append_roundtrip_factor",
    "append_roundtrip_64_bit_roundtrip",
    "append_roundtrip_logical",
    "begin_write_commit",

    # TODO: Remove when dbDisconnect() is implemented
    "can_disconnect",
    "disconnect_closed_connection",
    "disconnect_invalid_connection",
    # TODO: Remove when dbIsValid() is implemented
    "is_valid_connection",
    "is_valid_stale_connection",
    # TODO: Understand why test fails in R < 3.6
    if (getRversion() < "3.6") "connect_format",
    # Fails with older DBItest
    if (utils::packageVersion("DBItest") < "1.7.2") "reexport",
    NULL
  )
)

} # if (is.null(DBItest::get_default_context())) {
