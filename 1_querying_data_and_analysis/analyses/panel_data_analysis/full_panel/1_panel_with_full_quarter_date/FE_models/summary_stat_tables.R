### tables of summary statistics

library(plm)
library(stargazer)

panel <- readRDS("../panel_mdi_ind.rds")
panel_no_h <- panel[panel$hispanic_ind != 1, ]
panel_no_hb <- panel[panel_no_h$black_ind != 1, ]

aa_subset <- panel[panel$black_ind == 1, ]

h_subset <- panel[panel$hispanic_ind == 1, ]

###

## variables

var <- c("quarter", "IDRSSD", "npa_30_89_lagged_1_year", "npa_90_plus_lagged_1_year", "npa_nonacc_lagged_1_year", "net_income_lagged_1_year", "domestic_deposits_lagged_1_year", "tot_SB_loans_lagged_1_year", "tot_NPA", "post_crisis_ind", "mdi_ind", "asian_ind", "bhn_ind", "black_ind", "hispanic_ind")

not_mdi_vars <- data.frame(panel_no_hb[, !(names(panel) %in% var)])
not_mdi_vars <- not_mdi_vars[complete.cases(not_mdi_vars), ]

aa_vars <- data.frame(aa_subset[, !(names(panel) %in% var)])
aa_vars <- aa_vars[complete.cases(aa_vars), ]

h_vars <- data.frame(h_subset[, !(names(panel) %in% var)])
h_vars <- h_vars[complete.cases(h_vars), ]


## create tables with stargazer

stargazer(aa_vars, type = "html", title="Descriptive Statistics: African American MDIs", digits=3, out="aa_summary_statistics.htm", covariate.labels = c("Total Assets", "Total Equity", "T1 Leverage Ratio", "T1 Risk-Based Cap. Ratio", "Amt. CI Less 100k Loans", "Amt. CI 100k to 250k Loans", "Amt. CI 250k to 1000k Loans", "Less 100k % Change", "100k to 250k % Change", "250k to 1000k % Change", "Total CI Loans to Total Assets", "ROA", "Non-Performing Assets to Total Assets", "Total Deposits to Total Asset", "Amt. CI Less 100k Loans to Total Assets", "Amt. CI 100k to 250k Loans to Total Assets", "Amt. CI 250k to 1000k Loans to Total Assets"))

apply(aa_vars, 2, median)

stargazer(h_vars, type = "html", title="Descriptive Statistics: Hispanic MDIs", digits=3, out="h_summary_statistics.htm", covariate.labels = c("Total Assets", "Total Equity", "T1 Leverage Ratio", "T1 Risk-Based Cap. Ratio", "Amt. CI Less 100k Loans", "Amt. CI 100k to 250k Loans", "Amt. CI 250k to 1000k Loans", "Less 100k % Change", "100k to 250k % Change", "250k to 1000k % Change", "Total CI Loans to Total Assets", "ROA", "Non-Performing Assets to Total Assets", "Total Deposits to Total Asset", "Amt. CI Less 100k Loans to Total Assets", "Amt. CI 100k to 250k Loans to Total Assets", "Amt. CI 250k to 1000k Loans to Total Assets"))

apply(h_vars, 2, median)

stargazer(not_mdi_vars, type = "html", title="Descriptive Statistics: Non-MDIs", digits=3, out="non_mdi_summary_statistics.htm", covariate.labels = c("Total Assets", "Total Equity", "T1 Leverage Ratio", "T1 Risk-Based Cap. Ratio", "Amt. CI Less 100k Loans", "Amt. CI 100k to 250k Loans", "Amt. CI 250k to 1000k Loans", "Less 100k % Change", "100k to 250k % Change", "250k to 1000k % Change", "Total CI Loans to Total Assets", "ROA", "Non-Performing Assets to Total Assets", "Total Deposits to Total Asset", "Amt. CI Less 100k Loans to Total Assets", "Amt. CI 100k to 250k Loans to Total Assets", "Amt. CI 250k to 1000k Loans to Total Assets"))

apply(not_mdi_vars, 2, median)


