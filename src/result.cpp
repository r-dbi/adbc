#include <cpp11.hpp>
using namespace cpp11;

#include <adbc.h>

extern AdbcDriver driver;

const int MAX_CONNECTIONS = 16;

extern AdbcDatabase adbc_databases[];
extern AdbcConnection adbc_connections[];

AdbcStatement adbc_statements[MAX_CONNECTIONS];
bool active[MAX_CONNECTIONS];

#define REQUIRE(predicate) do { if (!(predicate)) {            \
  stop(__FILE__ ":%d: Can't query: %s", __LINE__, adbc_error.message); \
  }} while (0)

[[cpp11::register]]
SEXP cpp_send_query(const int connection_id, std::string sql) {
  if (connection_id >= MAX_CONNECTIONS) {
    stop("Invalid connection ID: %d.", connection_id);
  }
  if (active[connection_id]) {
    stop("Query is active: %d.", connection_id);
  }

  AdbcStatusCode adbc_status;
  AdbcError adbc_error;
  ArrowArrayStream arrow_stream;

  adbc_status = driver.StatementNew(&adbc_connections[connection_id], &adbc_statements[connection_id], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  adbc_status = driver.StatementSetSqlQuery(&adbc_statements[connection_id], sql.c_str(), &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  adbc_status = driver.StatementExecuteQuery(&adbc_statements[connection_id], &arrow_stream, NULL, &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  cpp11::function getNamespace = Rf_install("getNamespace");
  cpp11::sexp arrow_namespace(getNamespace("arrow"));

  cpp11::sexp stream_ptr_sexp(
      Rf_ScalarReal(static_cast<double>(reinterpret_cast<uintptr_t>(&arrow_stream))));
  cpp11::sexp record_batch_reader(Rf_lang2(Rf_install("ImportRecordBatchReader"), stream_ptr_sexp));
  cpp11::sexp out = cpp11::safe[Rf_eval](record_batch_reader, arrow_namespace);

  active[connection_id] = true;
  return out;
}

[[cpp11::register]]
double cpp_send_statement(const int connection_id, std::string sql) {
  if (connection_id >= MAX_CONNECTIONS) {
    stop("Invalid connection ID: %d.", connection_id);
  }
  if (active[connection_id]) {
    stop("Query is active: %d.", connection_id);
  }

  AdbcStatusCode adbc_status;
  AdbcError adbc_error;

  adbc_status = driver.StatementNew(&adbc_connections[connection_id], &adbc_statements[connection_id], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  adbc_status = driver.StatementSetSqlQuery(&adbc_statements[connection_id], sql.c_str(), &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  int64_t rows_affected;

  adbc_status = driver.StatementExecuteQuery(&adbc_statements[connection_id], NULL, &rows_affected, &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  adbc_status = driver.StatementRelease(&adbc_statements[connection_id], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  return static_cast<double>(rows_affected);
}

[[cpp11::register]]
void cpp_clear_result(const int connection_id) {
  if (connection_id >= MAX_CONNECTIONS) {
    stop("Invalid connection ID: %d.", connection_id);
  }
  if (!active[connection_id]) {
    stop("Query is not active: %d.", connection_id);
  }

  AdbcStatusCode adbc_status;
  AdbcError adbc_error;

  adbc_status = driver.StatementRelease(&adbc_statements[connection_id], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  active[connection_id] = false;
  return;
}
