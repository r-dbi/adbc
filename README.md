# adbc

<!-- badges: start -->
[![rcc](https://github.com/r-dbi/adbc/workflows/rcc/badge.svg)](https://github.com/r-dbi/adbc/actions)
[![Codecov test coverage](https://codecov.io/gh/r-dbi/adbc/branch/master/graph/badge.svg)](https://codecov.io/gh/r-dbi/adbc?branch=master)
<!-- badges: end -->

adbc is an DBI-compliant interface to databases supporting the experimental adbc database.

## Installation

Install from GitHub via

```r
# install.packages("devtools")
devtools::install_github("r-dbi/adbc")
```

## Example

Requires duckadbc from <https://github.com/r-dbi/duckadbc>:

- Clone the repository
- Install the R package with `R CMD INSTALL tools/rpkg`

```r
load_driver("Driver=~/git/R/duckdb/tools/rpkg/src/duckdb.so;Entrypoint=duckdb_adbc_driver_init")
```

## Update vendored files

Via `tools/adbc.sh`, currently requires a clean checkout at a specific path.

---

Please note that the 'adbc' project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
