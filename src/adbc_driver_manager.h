// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

#pragma once

#include <stddef.h>
#include <stdint.h>

struct AdbcDriver;

typedef uint8_t AdbcStatusCode;

/// No error.
#define ADBC_STATUS_OK 0
/// An unknown error occurred.
#define ADBC_STATUS_UNKNOWN 1
/// The operation is not implemented.
#define ADBC_STATUS_NOT_IMPLEMENTED 2
/// An operation was attempted on an uninitialized object.
#define ADBC_STATUS_UNINITIALIZED 3
/// The arguments are invalid.
#define ADBC_STATUS_INVALID_ARGUMENT 4
/// The object is in an invalid state for the given operation.
#define ADBC_STATUS_INTERNAL 5
/// An I/O error occurred.
#define ADBC_STATUS_IO 6

/// \brief Common entry point for drivers via the driver manager
///   (which uses dlopen(3)/LoadLibrary). The driver manager is told
///   to load a library and call a function of this type to load the
///   driver.
///
/// \param[in] count The number of entries to initialize. Provides
///   backwards compatibility if the struct definition is changed.
/// \param[out] driver The table of function pointers to initialize.
/// \param[out] initialized How much of the table was actually
///   initialized (can be less than count).
typedef AdbcStatusCode (*AdbcDriverInitFunc)(size_t count, struct AdbcDriver* driver,
                        size_t* initialized);

#ifdef __cplusplus
extern "C" {
#endif

#ifndef ADBC_DRIVER_MANAGER_H
#define ADBC_DRIVER_MANAGER_H

/// \brief Common entry point for drivers via the driver manager.
///
/// \param[in] connection The driver to initialize. Should be in
///   ODBC-style format ("Key1=Value1;Key2=Value2").
/// \param[in] count The number of entries to initialize. Provides
///   backwards compatibility if the struct definition is changed.
/// \param[out] driver The table of function pointers to initialize.
/// \param[out] initialized How much of the table was actually
///   initialized (can be less than count).
AdbcStatusCode AdbcLoadDriver(const char* connection, size_t count,
                              struct AdbcDriver* driver, size_t* initialized);

#endif  // ADBC_DRIVER_MANAGER_H

#ifdef __cplusplus
}
#endif
