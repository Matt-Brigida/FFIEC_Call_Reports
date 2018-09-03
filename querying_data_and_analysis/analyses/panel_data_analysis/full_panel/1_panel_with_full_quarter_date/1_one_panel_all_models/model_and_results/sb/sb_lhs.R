library(plm)

panel <- readRDS("../../full_panel.rds")


## without lagged SB loans

cols <- c("quarter", "totSBloans_Delt", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind")

panel <- panel[, cols]

panel <- panel[complete.cases(panel), ]

FEmodel1 <- plm(totSBloans_Delt ~  t1_LR_lagged_1_year + TETA_lagged_1_year + tot_SB_loans_TA_lagged_1 + ROA_lagged_1 + NPA_TA_lagged_1 + I(log(panel$total_assets_lagged_1_year)) + I(log(panel$total_assets_lagged_1_year) * ROA_lagged_1) + TD_TA_lagged_1 + post_crisis_ind + fin_crisis_ind + I(t1_LR_lagged_1_year * african_am_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + de_novo, data = panel, model = "within", effect = "individual")

summary(FEmodel1)


## with lagged SB loans: we lose too many observations to use the following model (over 60,000 out of 200,000)

panel <- readRDS("../full_panel.rds")

cols <- c("quarter", "totSBloans_Delt", "totSBloans_Delt_lagged_1_year", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind")

panel <- panel[, cols]

panel <- panel[complete.cases(panel), ]

FEmodel2 <- plm(totSBloans_Delt ~  totSBloans_Delt_lagged_1_year + t1_LR_lagged_1_year + TETA_lagged_1_year + tot_SB_loans_TA_lagged_1 + ROA_lagged_1 + NPA_TA_lagged_1 + I(log(panel$total_assets_lagged_1_year)) + I(log(panel$total_assets_lagged_1_year) * ROA_lagged_1) + TD_TA_lagged_1 + post_crisis_ind + fin_crisis_ind + I(t1_LR_lagged_1_year * african_am_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + de_novo, data = panel, model = "within", effect = "individual")

summary(FEmodel2)


