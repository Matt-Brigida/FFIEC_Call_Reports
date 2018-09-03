
library(plm)

panel <- readRDS("../full_panel.rds")

panel <- panel[, c("quarter", "totSBloans_Delt_lagged_1_year", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year")]

panel <- panel[complete.cases(panel), ]
