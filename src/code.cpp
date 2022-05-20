#include <cpp11.h>
using namespace cpp11;

#include "adbc/adbc_driver_manager.h"

[[cpp11::register]]
void load_driver(const std::string connection) {
  AdbcDriver driver;
  size_t initialized = 0;
}
