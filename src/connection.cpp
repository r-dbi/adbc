#include <cpp11.hpp>
using namespace cpp11;

#include <adbc.h>

extern AdbcDriver driver;

const int MAX_CONNECTIONS = 16;

AdbcDatabase adbc_databases[MAX_CONNECTIONS];
AdbcConnection adbc_connections[MAX_CONNECTIONS];
unsigned int n_connections = 0;

#define REQUIRE(predicate) do { if (!(predicate)) {            \
  stop(__FILE__ ":%d: Can't connect: %s", __LINE__, adbc_error.message); \
  }} while (0)

[[cpp11::register]]
int cpp_connect(const int driver_id) {
  if (n_connections >= MAX_CONNECTIONS) {
    stop("Can connect at most %d times.", MAX_CONNECTIONS);
  }

  AdbcStatusCode adbc_status;
  AdbcError adbc_error;

  adbc_status = driver.DatabaseNew(&adbc_databases[n_connections], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);
  adbc_status = driver.DatabaseInit(&adbc_databases[n_connections], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  // connect!
  adbc_status = driver.ConnectionNew(&adbc_connections[n_connections], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);
  adbc_status = driver.ConnectionInit(&adbc_connections[n_connections], &adbc_databases[n_connections], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  return n_connections++;
}

[[cpp11::register]]
void cpp_disconnect(const int connection_id) {
  if ((unsigned int)connection_id + 1 != n_connections) {
    stop("Can only disconnect from the most recently connected connection, trying to disconnect from %d out of %d.", connection_id, n_connections);
  }

  AdbcStatusCode adbc_status;
  AdbcError adbc_error;

  adbc_status = driver.ConnectionRelease(&adbc_connections[connection_id], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);
  adbc_status = driver.DatabaseRelease(&adbc_databases[connection_id], &adbc_error);
  REQUIRE(adbc_status == ADBC_STATUS_OK);

  --n_connections;
  return;
}
