#include <cpp11.hpp>
using namespace cpp11;

#include <driver_manager/adbc_driver_manager.h>

AdbcDriver driver;
int n_drivers = 0;

[[cpp11::register]]
int cpp_load_driver(const std::string connection, const std::string entrypoint) {
  if (n_drivers > 0) {
    cpp11::stop("cpp_load_driver(): Can load only one driver.");
  }

  // TODO: version provided by client?
  const size_t expected = ADBC_VERSION_1_0_0;

  AdbcError error = {};

  const char* c_entrypoint = (entrypoint == "") ? NULL : entrypoint.c_str();
  AdbcStatusCode success = AdbcLoadDriver(connection.c_str(), c_entrypoint, expected, &driver, &error);

  if (success != ADBC_STATUS_OK) {
    cpp11::stop("Could not load driver: error code %d: %s.", success, error.message);
  }

  return n_drivers++;
}

[[cpp11::register]]
int cpp_use_radbc_driver(cpp11::external_pointer<AdbcDriver> driver_) {
  if (n_drivers > 0) {
    cpp11::stop("cpp_use_radbc_driver(): Can load only one driver.");
  }

  *&driver = *driver_;
  return n_drivers++;
}
