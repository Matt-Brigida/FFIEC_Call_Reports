library(xts)
library(quantmod)

## lag data
d1 <- readRDS("./amt_CI_less_100_SB_loans.rds")
d1 <- lag(d1, k = 4)
saveRDS(d1, "amt_CI_less_100_SB_loans_lagged_1_year.rds")

d1 <- readRDS("./amt_CI_100_250_SB_loans.rds")
d1 <- lag(d1, k = 4)
saveRDS(d1, "amt_CI_100_250_SB_loans_lagged_1_year.rds")

d1 <- readRDS("./amt_CI_250_1000_SB_loans.rds")
d1 <- lag(d1, k = 4)
saveRDS(d1, "amt_CI_250_1000_SB_loans_lagged_1_year.rds")

## % change data

d1 <- readRDS("./amt_CI_less_100_SB_loans.rds")
d2 <- readRDS("./amt_CI_less_100_SB_loans_lagged_1_year.rds")
d3 <- (d1 / d2) - 1
saveRDS(d3, "amt_CI_less_100_SB_loans_Delt.rds")

d1 <- readRDS("./amt_CI_100_250_SB_loans.rds")
d2 <- readRDS("./amt_CI_100_250_SB_loans_lagged_1_year.rds")
d3 <- (d1 / d2) - 1
saveRDS(d3, "amt_CI_100_250_SB_loans_Delt.rds")

d1 <- readRDS("./amt_CI_250_1000_SB_loans.rds")
d2 <- readRDS("./amt_CI_250_1000_SB_loans_lagged_1_year.rds")
d3 <- (d1 / d2) - 1
saveRDS(d3, "amt_CI_250_1000_SB_loans_Delt.rds")

## read in lagged total assets to calculate $ amount of loans divided by total assets

