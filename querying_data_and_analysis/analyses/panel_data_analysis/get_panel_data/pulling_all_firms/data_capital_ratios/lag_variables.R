library(xts)

t1_leverage_ratio <- readRDS("t1_leverage_ratio.rds")
t1_LR_lagged_1_year <- lag(t1_leverage_ratio, k = 4)
saveRDS(t1_LR_lagged_1_year, "t1_LR_lagged_1_year.rds")


t1_risk_based_capital_ratio <- readRDS("./t1_risk_based_capital_ratio.rds")
t1_RBCR_lagged_1_year <- lag(t1_risk_based_capital_ratio, k = 4)
saveRDS(t1_RBCR_lagged_1_year, "t1_RBCR_lagged_1_year.rds")
