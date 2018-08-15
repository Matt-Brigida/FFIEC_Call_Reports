library(plm)
library(stargazer)

data <- readRDS("../panel_mdi_ind.rds")

panel <- pdata.frame(data, index = c("IDRSSD", "quarter"), drop.index=TRUE, row.names=TRUE)

FEmodel1 <- plm(amt_CI_less_100_SB_loans_Delt ~  t1_LR_lagged_1_year + I(t1_LR_lagged_1_year * black_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + less_100_lagged_SB_loans_TA + ROA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

FEmodel2 <- plm(amt_CI_100_250_SB_loans_Delt ~  t1_LR_lagged_1_year + I(t1_LR_lagged_1_year * black_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + X100_250_lagged_SB_loans_TA + ROA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

FEmodel3 <- plm(amt_CI_250_1000_SB_loans_Delt ~  t1_LR_lagged_1_year + I(t1_LR_lagged_1_year * black_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + X250_1000_lagged_SB_loans_TA + ROA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")


stargazer(FEmodel1, FEmodel2, FEmodel3, covariate.labels = c("T1 Leverage Ratio", "T1 Leverage Ratio x AA Ind.", "T1 Leverage Ratio x His Ind", "Amt. Small-Bus. Loans < 100,000", "Amt. Small-Bus. Loans bet. 100,000 and 250,000", "Amt. Small-Bus. Loans bet. 250,000 and 1,000,000", "ROA", "NPA", "ln(TA)", "Deposits", "Post Crisis"), dep.var.labels = c("Small Business Loans less than 100,000", "Small Business Loans between 100,000 and 250,000", "Small Business Loans between 250,000 and 1,000,000"), digits = 3, no.space=TRUE, header=FALSE, type='html', omit.stat=c("LL"), title = "Annual % Change in the Amount of Small-Business Commercial and Industrial Loans Outstanding", out = "t1_lev_ratio.htm", intercept.bottom = TRUE, notes = "Results are from fixed-effects models with both time and bank fixed effects.  The sample is quarterly data ranging from Q1 2001 through Q4 2017.  The dependent variable is the annual percent change in the amount of small-business loans outstanding.")




FEmodel4 <- plm(amt_CI_less_100_SB_loans_Delt ~  t1_RBCR_lagged_1_year + I(t1_RBCR_lagged_1_year * black_ind) + I(t1_RBCR_lagged_1_year * hispanic_ind) + less_100_lagged_SB_loans_TA + ROA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

FEmodel5 <- plm(amt_CI_100_250_SB_loans_Delt ~  t1_RBCR_lagged_1_year + I(t1_RBCR_lagged_1_year * black_ind) + I(t1_RBCR_lagged_1_year * hispanic_ind) + X100_250_lagged_SB_loans_TA + ROA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

FEmodel6 <- plm(amt_CI_250_1000_SB_loans_Delt ~  t1_RBCR_lagged_1_year + I(t1_RBCR_lagged_1_year * black_ind) + I(t1_RBCR_lagged_1_year * hispanic_ind) + X250_1000_lagged_SB_loans_TA + ROA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

stargazer(FEmodel4, FEmodel5, FEmodel6, covariate.labels = c("T1 Risk-Based Capital Ratio", "T1 RBCR x AA Ind.", "T1 RBCR x His Ind", "Amt. Small-Bus. Loans < 100,000", "Amt. Small-Bus. Loans bet. 100,000 and 250,000", "Amt. Small-Bus. Loans bet. 250,000 and 1,000,000", "ROA", "NPA", "ln(TA)", "Deposits", "Post Crisis"), dep.var.labels = c("Small Business Loans less than 100,000", "Small Business Loans between 100,000 and 250,000", "Small Business Loans between 250,000 and 1,000,000"), digits = 3, no.space=TRUE, header=FALSE, type='html', omit.stat=c("LL"), title = "Annual % Change in the Amount of Small-Business Commercial and Industrial Loans Outstanding", out = "t1_RBC_ratio.htm", intercept.bottom = TRUE, notes = "Results are from fixed-effects models with both time and bank fixed effects.  The sample is quarterly data ranging from Q1 2001 through Q4 2017.  The dependent variable is the annual percent change in the amount of small-business loans outstanding.")
