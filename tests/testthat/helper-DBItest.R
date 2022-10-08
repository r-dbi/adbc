DBItest::make_context(
  adbc("/Users/kirill/git/R/duckdb/tools/rpkg/src/duckdb.so", "duckdb_adbc_init"),
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
    "send_query_non_string",
    "send_query_syntax_error",
    "fetch_zero_rows",
    "get_query_non_string",
    "get_query_syntax_error",
    "get_query_zero_rows",
    "quote_identifier_string",
    "send_statement_non_string",
    "send_statement_syntax_error",
    "send_statement_params",
    "execute_non_string",
    "execute_syntax_error",
    "execute_params",
    "create_table_error",
    "append_table_missing",
    "roundtrip_timestamp",
    "exists_table",
    "exists_table_temporary",
    "list_fields_wrong_table",
    "create_roundtrip_quotes",
    "append_table_new",

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
