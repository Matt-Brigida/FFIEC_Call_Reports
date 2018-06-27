### for LR and RBCR have to divide 2015 onward by 100.

library(xts)

lr <- readRDS("t1_leverage_ratio.rds")

lr_2014 <- lr["/2015-01-01"]
lr_2015 <- lr["2015-01-01/"] / 100

lr_new <- rbind(lr_2014, lr_2015)

saveRDS(lr_new, "t1_leverage_ratio.rds")


cr <- readRDS("./t1_risk_based_capital_ratio.rds")

cr_2014 <- cr["/2015-01-01"]
cr_2015 <- cr["2015-01-01/"] / 100

cr_new <- rbind(cr_2014, cr_2015)

saveRDS(cr_new, "t1_risk_based_capital_ratio.rds")
