#! /bin/sh

set -e
set -x

rm -rf src/adbc
cp -r ~/git/arrow/cpp/src/adbc src/
cp ~/git/arrow/cpp/src/arrow/c/abi.h src/adbc
gsed -i 's#arrow/c#adbc#' src/adbc/*.cc src/adbc/*.h
