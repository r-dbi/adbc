# install.packages("remotes")
# remotes::install_github("r-dbi/adbc")
# remotes::install_github("r-dbi/duckdb/tools/rpkg", build = FALSE)
library(duckadbc)
library(adbc)
library(dbplyr)
library(arrow, warn.conflicts = FALSE)

n <- 10000

duck_con_adbc <- dbConnect(
  adbc(asNamespace("duckadbc")$.__NAMESPACE__.$DLLs$duckadbc[["path"]], "duckdb_adbc_init")
)

duck_con_dbi <- dbConnect(duckadbc::duckdb())

flights <- copy_inline(duck_con_adbc, nycflights13::flights[1:n, ])
sql <- flights %>% sql_render()

system.time(dbExecute(duck_con_adbc, paste0("CREATE TABLE flights AS ", sql)))
system.time(dbExecute(duck_con_dbi, paste0("CREATE TABLE flights AS ", sql)))

bench::mark(
  adbc_direct = dbReadTable(duck_con_adbc, "flights"),
  adbc_rbr = dbReadTableArrow(duck_con_adbc, "flights"),
  #adbc = as.data.frame(dbReadTableArrow(duck_con_adbc, "flights")),
  #adbc_materialized = as.data.frame(dbReadTableArrow(duck_con_adbc, "flights"))[n:1, ],
  dbi_direct = dbReadTable(duck_con_dbi, "flights"),
  dbi_rbr = dbReadTableArrow(duck_con_dbi, "flights"),
  #dbi = as.data.frame(dbReadTableArrow(duck_con_dbi, "flights")),
  #dbi_materialized = as.data.frame(dbReadTableArrow(duck_con_dbi, "flights"))[n:1, ],
  iterations = 5,
  check = FALSE
)
