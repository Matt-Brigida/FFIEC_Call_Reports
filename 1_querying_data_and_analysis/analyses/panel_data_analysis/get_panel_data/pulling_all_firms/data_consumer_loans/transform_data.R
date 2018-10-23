library(xts)
library(quantmod)

## % change data

d <- readRDS("./total_consumer_loans.rds")

d1 <- lag(d, k = 4)

d2 <- (d / d1) - 1

saveRDS(d2, "total_consumer_loans_delt.rds")

## lag one year

saveRDS(d1, "total_consumer_loans_lagged_1_year.rds")
