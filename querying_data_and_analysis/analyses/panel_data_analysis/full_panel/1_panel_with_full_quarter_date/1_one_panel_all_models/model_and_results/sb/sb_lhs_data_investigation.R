library(plm)
library(stargazer)

panel <- readRDS("../../full_panel.rds")


## without lagged SB loans

cols <- c("quarter", "totSBloans_Delt", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind")

panel <- panel[, cols]

panel <- panel[complete.cases(panel), ]


## viz data times ------
pdf("sample_frequency_hitogram.pdf")
barplot(prop.table(table(panel$quarter)), xlab = "Quarter", ylab = "% of Sample", main = "Frequency of Our Sample by Quarter")
dev.off()

