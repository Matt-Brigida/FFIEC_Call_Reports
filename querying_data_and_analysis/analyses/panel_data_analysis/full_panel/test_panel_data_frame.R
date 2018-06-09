library(xts)
library(plm)

data <- readRDS("./panel.rds")

panel <- pdata.frame(data, index = c("IDRSSD", "quarter"), drop.index=TRUE, row.names=TRUE)

testFEmodel <- plm(loans_cap ~  retained_earnings + tier_1_cap + total_noninterest_income, data = panel, model = "within", effect = "twoways")

summary(testFEmodel)

### can SUCCESSFULLY run a FE model with plm!
