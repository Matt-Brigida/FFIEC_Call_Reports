
library(plm)
library(stargazer)

panel <- readRDS("../../../full_panel.rds")

panel <- panel[, c("quarter", "totSBloans_Delt_lagged_1_year", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "tot_NPA_TA", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind")]

panel <- panel[complete.cases(panel), ]

panel <- panel[panel$totSBloans_Delt_lagged_1_year < 2, ]

FEmodel1a <- plm(tot_NPA_TA ~ t1_LR_lagged_1_year + I(tot_SB_loans_TA_lagged_1 * african_am_ind) + I(tot_SB_loans_TA_lagged_1 * hispanic_ind) + totSBloans_Delt_lagged_1_year + tot_SB_loans_TA_lagged_1 + ROA_lagged_1 + I(log(panel$total_assets_lagged_1_year)) + TD_TA_lagged_1 + post_crisis_ind + fin_crisis_ind + de_novo, data = panel, model = "within", effect = "individual")

summary1a <- summary(FEmodel1a)

FEmodel2b <- plm(tot_NPA_TA ~  t1_LR_lagged_1_year + I(tot_SB_loans_TA_lagged_1 * african_am_ind) + I(tot_SB_loans_TA_lagged_1 * hispanic_ind) + totSBloans_Delt_lagged_1_year + tot_SB_loans_TA_lagged_1 + ROA_lagged_1 + I(log(panel$total_assets_lagged_1_year)) + TD_TA_lagged_1 + post_crisis_ind + fin_crisis_ind + de_novo + I(log(panel$total_assets_lagged_1_year) * ROA_lagged_1), data = panel, model = "within", effect = "individual")

summary2b <- summary(FEmodel2b)

FEmodel3b <- plm(tot_NPA_TA ~  t1_LR_lagged_1_year + I(tot_SB_loans_TA_lagged_1 * african_am_ind) + I(tot_SB_loans_TA_lagged_1 * hispanic_ind) + totSBloans_Delt_lagged_1_year + tot_SB_loans_TA_lagged_1 + ROA_lagged_1 + I(log(panel$total_assets_lagged_1_year)) + TD_TA_lagged_1 + post_crisis_ind + fin_crisis_ind + de_novo + I(log(panel$total_assets_lagged_1_year) * ROA_lagged_1) + TETA_lagged_1_year, data = panel, model = "within", effect = "individual")

summary3b <- summary(FEmodel3b)


stargazer(FEmodel1a, FEmodel2b, FEmodel3b, covariate.labels = c("T1LR", "Small Business Loans * AA", "Small Business Loans * His", "% Change in Small Business Loans", "Small Business Loans", "ROA", "ln(TA)", "Deposits", "Post Crisis", "Fin Crisis", "De Novo", "ln(TA) * ROA", "TE"), dep.var.labels = "NPA", digits = 3, no.space=TRUE, header=FALSE, type='html', omit.stat=c("LL"), title = "All Banks: Determinants of NPAs", out = "tables_for_paper.htm", intercept.bottom = TRUE, notes = "Results are from fixed-effects models with bank fixed effects, for the years 2001 through 2017.  Data are quarterly.  The dependent variable is Nonperforming Assets divided by Total Assets (NPA). Business loans are defined as the sum of commercial, industrial, and commercial real-estate loans.  All variables are lagged one year relative to NPA.")
