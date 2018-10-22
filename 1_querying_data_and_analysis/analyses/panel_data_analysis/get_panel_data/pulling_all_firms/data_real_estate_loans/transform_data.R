library(xts)
library(quantmod)

## % change data

d <- readRDS("./Cloans_cap.rds")

d1 <- lag(d, k = 4)

d2 <- (d / d1) - 1

saveRDS(d2, "tot_commercial_loans_delt.rds")

## lag one year

saveRDS(d1, "tot_commercial_loans_lagged_1_year.rds")
