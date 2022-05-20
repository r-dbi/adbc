#include <cpp11.hpp>
using namespace cpp11;

#include "adbc/adbc_driver_manager.h"

[[cpp11::register]]
void cpp_load_driver(const std::string connection) {
  AdbcDriver driver;
  // TODO: version provided by client?
  const size_t expected = ADBC_VERSION_0_0_1;
  size_t initialized = 0;

  AdbcStatusCode success = AdbcLoadDriver(connection.c_str(), expected, &driver, &initialized);

  if (success != ADBC_STATUS_OK) {
    cpp11::stop("Could not load driver: error code %d.", success);
  }

  if (initialized < sizeof(driver)) {
    cpp11::stop("Initialization incomplete: %d expected, %d provided.", expected, initialized);
  }
}
