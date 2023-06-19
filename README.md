
<!-- README.md is generated from README.Rmd. Please edit that file -->

⚠️ ⚠️ ⚠️  This package is archived, new development continues in [r-dbi/adbi](https://github.com/r-dbi/adbi). ⚠️ ⚠️ ⚠️ 

# adbc

<!-- badges: start -->

[![rcc](https://github.com/r-dbi/adbc/workflows/rcc/badge.svg)](https://github.com/r-dbi/adbc/actions)
[![Codecov test
coverage](https://codecov.io/gh/r-dbi/adbc/branch/master/graph/badge.svg)](https://codecov.io/gh/r-dbi/adbc?branch=master)
<!-- badges: end -->

adbc is an DBI-compliant interface to databases supporting the
experimental adbc database.

## Installation

Install from GitHub via

``` r
# install.packages("devtools")
devtools::install_github("r-dbi/adbc")
```

## Example

Requires duckadbc from <https://github.com/r-dbi/duckadbc>:

- Clone the repository
- Install the R package with `R CMD INSTALL tools/rpkg`

``` r
library(adbc)
library(DBI)

drv <- adbc(asNamespace("duckadbc")$.__NAMESPACE__.$DLLs$duckadbc[["path"]], "duckdb_adbc_init")

con <- dbConnect(drv)

dbExecute(con, "CREATE TABLE a (x INTEGER, y FLOAT)")
#> [1] 0

dbExecute(con, "INSERT INTO a (x, y) VALUES (0, 0.5), (1, 1.5), (2, 2.5)")
#> [1] 0

dbGetQuery(con, "SELECT * FROM a WHERE x > 1")
#>   x   y
#> 1 2 2.5

dbGetQueryArrow(con, "SELECT * FROM a WHERE x > 1")
#> RecordBatchReader
#> x: int32
#> y: float

as.data.frame(dbGetQueryArrow(con, "SELECT * FROM a WHERE x > 1"))
#>   x   y
#> 1 2 2.5

dbDisconnect(con)
```

## Update vendored files

Via `tools/adbc.sh`, currently requires a clean checkout at a specific
path.

------------------------------------------------------------------------

Please note that the ‘adbc’ project is released with a [Contributor Code
of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you
agree to abide by its terms.
