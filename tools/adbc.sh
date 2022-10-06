#! /bin/sh

set -e
set -x

rm -rf src/adbc
mkdir src/adbc
cp -r ~/git/arrow-adbc/adbc.h src/adbc/
cp -r ~/git/arrow-adbc/c/driver_manager src/adbc/driver_manager/
# gsed -i 's#arrow/c#adbc#' src/adbc/*.cc src/adbc/*.h
