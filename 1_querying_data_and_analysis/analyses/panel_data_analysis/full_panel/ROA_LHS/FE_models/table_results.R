library(plm)
library(stargazer)

data <- readRDS("../panel_mdi_ind.rds")

panel <- pdata.frame(data, index = c("IDRSSD", "quarter"), drop.index=TRUE, row.names=TRUE)

FEmodel1 <- plm(ROA ~ t1_LR_lagged_1_year + I(t1_LR_lagged_1_year * black_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + amt_CI_less_100_SB_loans_Delt_lagged_1_year + less_100_lagged_SB_loans_TA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

FEmodel2 <- plm(ROA ~ t1_LR_lagged_1_year + I(t1_LR_lagged_1_year * black_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + amt_CI_100_250_SB_loans_Delt_lagged_1_year + X100_250_lagged_SB_loans_TA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

FEmodel3 <- plm(ROA ~ t1_LR_lagged_1_year + I(t1_LR_lagged_1_year * black_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + amt_CI_250_1000_SB_loans_Delt_lagged_1_year + X250_1000_lagged_SB_loans_TA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

stargazer(FEmodel1, FEmodel2, FEmodel3, covariate.labels = c("T1 Leverage Ratio", "T1 Leverage Ratio x AA Ind.", "T1 Leverage Ratio x His Ind",  "Percent Change SB Loans (less than 100)", "Amt. Small-Bus. Loans < 100,000", "Percent Change SB Loans (100 to 250)", "Amt. Small-Bus. Loans bet. 100,000 and 250,000", "Percent Change SB Loans (250 to 1000)", "Amt. Small-Bus. Loans bet. 250,000 and 1,000,000", "NPA", "ln(TA)", "Deposits", "Post Crisis"), dep.var.labels = c("ROA: SBLoans less than 100k", "ROA: SB Loans between 100k and 250k", "ROA: SB Loans between 250k and 1000k"), digits = 3, no.space=TRUE, header=FALSE, type='html', title = "", out = "ROA_t1_ratio.htm", intercept.bottom = TRUE, notes = "Results are from fixed-effects models with both time and bank fixed effects.  The sample is quarterly data ranging from Q1 2001 through Q4 2017.  The dependent variable is ROA.  All independent variables are lagged 1 year.")


FEmodel4 <- plm(ROA ~ t1_RBCR_lagged_1_year + I(t1_RBCR_lagged_1_year * black_ind) + I(t1_RBCR_lagged_1_year * hispanic_ind) + amt_CI_less_100_SB_loans_Delt_lagged_1_year + less_100_lagged_SB_loans_TA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

FEmodel5 <- plm(ROA ~ t1_RBCR_lagged_1_year + I(t1_RBCR_lagged_1_year * black_ind) + I(t1_RBCR_lagged_1_year * hispanic_ind) + amt_CI_100_250_SB_loans_Delt_lagged_1_year + X100_250_lagged_SB_loans_TA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

FEmodel6 <- plm(ROA ~ t1_RBCR_lagged_1_year + I(t1_RBCR_lagged_1_year * black_ind) + I(t1_RBCR_lagged_1_year * hispanic_ind) + amt_CI_250_1000_SB_loans_Delt_lagged_1_year + X250_1000_lagged_SB_loans_TA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind), data = panel, model = "within", effect = "twoways")

stargazer(FEmodel4, FEmodel5, FEmodel6, covariate.labels = c("T1 Risk-Based Capital Ratio", "T1 RBC Ratio x AA Ind.", "T1 RBC Ratio x His Ind",  "Percent Change SB Loans (less than 100)", "Amt. Small-Bus. Loans < 100,000", "Percent Change SB Loans (100 to 250)", "Amt. Small-Bus. Loans bet. 100,000 and 250,000", "Percent Change SB Loans (250 to 1000)", "Amt. Small-Bus. Loans bet. 250,000 and 1,000,000", "NPA", "ln(TA)", "Deposits", "Post Crisis"), dep.var.labels = c("ROA: SBLoans less than 100k", "ROA: SB Loans between 100k and 250k", "ROA: SB Loans between 250k and 1000k"), digits = 3, no.space=TRUE, header=FALSE, type='html', title = "", out = "ROA_t1_RCBR_ratio.htm", intercept.bottom = TRUE, notes = "Results are from fixed-effects models with both time and bank fixed effects.  The sample is quarterly data ranging from Q1 2001 through Q4 2017.  The dependent variable is ROA.  All independent variables are lagged 1 year.")
