library(xts)

net_income <- readRDS("net_income.rds")
net_income_lagged_1_year <- lag(net_income, k = 4)
saveRDS(net_income_lagged_1_year, "net_income_lagged_1_year.rds")

