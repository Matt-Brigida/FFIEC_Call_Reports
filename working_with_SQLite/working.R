library(RSQLite)

dbc <- DBI::dbConnect(RSQLite::SQLite(), "../callReports")

dbListTables(dbc)
