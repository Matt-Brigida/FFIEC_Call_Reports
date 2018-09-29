library(plm)
library(stargazer)

panel <- readRDS("../../full_panel.rds")


## without lagged SB loans

cols <- c("quarter", "totSBloans_Delt", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind")

panel <- panel[, cols]

panel <- panel[complete.cases(panel), ]


## viz data times ------
barplot(prop.table(table(panel$quarter)))


FEmodel1 <- plm(totSBloans_Delt ~  t1_LR_lagged_1_year + + I(t1_LR_lagged_1_year * african_am_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + TETA_lagged_1_year + tot_SB_loans_TA_lagged_1 + ROA_lagged_1 + NPA_TA_lagged_1 + I(log(panel$total_assets_lagged_1_year)) + TD_TA_lagged_1 + post_crisis_ind + fin_crisis_ind + de_novo, data = panel, model = "within", effect = "individual")

## summary(FEmodel1)

FEmodel2 <- plm(totSBloans_Delt ~  t1_LR_lagged_1_year + I(t1_LR_lagged_1_year * african_am_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + TETA_lagged_1_year + tot_SB_loans_TA_lagged_1 + ROA_lagged_1 + NPA_TA_lagged_1 + I(log(panel$total_assets_lagged_1_year))  + TD_TA_lagged_1 + post_crisis_ind + fin_crisis_ind + de_novo + I(log(panel$total_assets_lagged_1_year) * ROA_lagged_1), data = panel, model = "within", effect = "individual")

## summary(FEmodel2)

FEmodel3 <- plm(totSBloans_Delt ~  t1_LR_lagged_1_year + I(t1_LR_lagged_1_year * african_am_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + TETA_lagged_1_year + tot_SB_loans_TA_lagged_1 + ROA_lagged_1 + NPA_TA_lagged_1 + I(log(panel$total_assets_lagged_1_year)) + TD_TA_lagged_1 + post_crisis_ind + fin_crisis_ind + de_novo + I(log(panel$total_assets_lagged_1_year) * ROA_lagged_1) + I(log(panel$total_assets_lagged_1_year) * NPA_TA_lagged_1), data = panel, model = "within", effect = "individual")

## summary(FEmodel3)

stargazer(FEmodel1, FEmodel2, FEmodel3, covariate.labels = c("T1LR", "T1LR * AA", "T1LR * His", "TE", "Small Business Loans", "ROA", "NPA", "ln(TA)", "Deposits", "Post Crisis", "Fin Crisis", "De Novo", "ln(TA) * ROA", "ln(TA) * NPA"), dep.var.labels = "% Change in Amt. SB Loans", digits = 3, no.space=TRUE, header=FALSE, type='html', omit.stat=c("LL"), title = "All Banks: Determinants of the % Change in the Amount of Small-Business Loans", out = "tablesChangeASBL.htm", intercept.bottom = TRUE, notes = "Results are from fixed-effects models with bank fixed effects, for the years 2001 through 2017.  Data are quarterly.  The dependent variable is percent change in the amount of small-business loans.  Small-Business loans are defined as the sum of commercial, industrial, and commercial real-estate loans.  All variables are lagged one year relative to the dependent variable.")
