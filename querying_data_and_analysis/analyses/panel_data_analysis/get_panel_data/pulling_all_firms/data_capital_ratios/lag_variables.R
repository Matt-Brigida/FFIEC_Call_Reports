library(xts)

t1_leverage_ratio_none_past_2014 <- readRDS("t1_leverage_ratio_none_past_2014.rds")
t1_LR_pre_2014_lagged_1_year <- lag(t1_leverage_ratio_none_past_2014, k = 4)
saveRDS(t1_LR_pre_2014_lagged_1_year, "t1_LR_pre_2014_lagged_1_year.rds")


t1_risk_based_capital_ratio_none_past_2014 <- readRDS("./t1_risk_based_capital_ratio_none_past_2014.rds")
t1_RBCR_pre_2014_lagged_1_year <- lag(t1_risk_based_capital_ratio_none_past_2014, k = 4)
saveRDS(t1_RBCR_pre_2014_lagged_1_year, "t1_RBCR_pre_2014_lagged_1_year.rds")
