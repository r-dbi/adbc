#include <cpp11.hpp>
using namespace cpp11;

#include <driver_manager/adbc_driver_manager.h>

AdbcDriver driver;
int n_drivers = 0;

[[cpp11::register]]
int cpp_load_driver(const std::string connection) {
  if (n_drivers > 0) {
    cpp11::stop("Can load only one driver.");
  }

  // TODO: version provided by client?
  const size_t expected = ADBC_VERSION_1_0_0;

  AdbcError error = {};

  AdbcStatusCode success = AdbcLoadDriver(connection.c_str(), "duckdb_adbc_init", expected, &driver, &error);

  if (success != ADBC_STATUS_OK) {
    cpp11::stop("Could not load driver: error code %d: %s.", success, error.message);
  }

  return n_drivers++;
}
