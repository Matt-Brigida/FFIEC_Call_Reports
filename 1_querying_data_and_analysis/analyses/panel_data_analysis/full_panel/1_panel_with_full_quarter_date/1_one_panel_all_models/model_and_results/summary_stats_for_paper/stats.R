### tables of summary statistics

library(plm)
library(stargazer)

## pull MDI and non-MDI subsets-----------------

panel <- readRDS("../../full_panel.rds")

## variables

var <- c("quarter", "totSBloans_Delt", "totNumSBloans_Delt", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind")

panel_vars <- data.frame(panel[, var])

panel_vars <- panel_vars[complete.cases(panel_vars), ]

not_mdi_vars <- panel_vars[panel_vars$african_am_ind != 1, ]
not_mdi_vars <- not_mdi_vars[not_mdi_vars$hispanic_ind != 1, ]

aa_vars <- panel_vars[panel_vars$african_am_ind == 1, ]

h_vars <- panel_vars[panel_vars$hispanic_ind == 1, ]

## remove aa and h indicators----

inds <- c("african_am_ind", "hispanic_ind", "quarter", "TETA_lagged_1_year")

not_mdi_vars <- not_mdi_vars[ , !(names(not_mdi_vars) %in% inds)]
aa_vars <- aa_vars[ , !(names(aa_vars) %in% inds)]
h_vars <- h_vars[ , !(names(h_vars) %in% inds)]


## create tables with stargazer

stargazer(aa_vars, type = "html", title="Descriptive Statistics: African American MDIs", digits=3, out="aa_summary_statistics.htm", covariate.labels = c("% Change Amt. S. Bus. Loans", "% Change Num. S. Bus. Loans", "Tier 1 Leverage Ratio", "Small-Business Loans", "ROA", "NPA", "Total Assets", "Deposits", "De Novo", "Post Crisis", "Financial Crisis"))

apply(aa_vars, 2, median)

##            totSBloans_Delt         totNumSBloans_Delt 
##              -3.494022e-02              -3.067485e-02 
##        t1_LR_lagged_1_year   tot_SB_loans_TA_lagged_1 
##               8.630000e-02               3.856615e-02 
##               ROA_lagged_1            NPA_TA_lagged_1 
##               6.455006e-04               3.518268e-03 
## total_assets_lagged_1_year             TD_TA_lagged_1 
##               1.052330e+05               8.650878e-01 
##                    de_novo            post_crisis_ind 
##               0.000000e+00               0.000000e+00 
##             fin_crisis_ind 
##               0.000000e+00 

stargazer(h_vars, type = "html", title="Descriptive Statistics: Hispanic MDIs", digits=3, out="h_summary_statistics.htm", covariate.labels = c("% Change Amt. S. Bus. Loans", "% Change Num. S. Bus. Loans", "Tier 1 Leverage Ratio", "Small-Business Loans", "ROA", "NPA", "Total Assets", "Deposits", "De Novo", "Post Crisis", "Financial Crisis"))

apply(h_vars, 2, median)

##            totSBloans_Delt         totNumSBloans_Delt 
##              -1.549727e-02              -2.892562e-02 
##        t1_LR_lagged_1_year   tot_SB_loans_TA_lagged_1 
##               1.027520e-01               3.363510e-02 
##               ROA_lagged_1            NPA_TA_lagged_1 
##               3.447064e-03               1.270425e-03 
## total_assets_lagged_1_year             TD_TA_lagged_1 
##               1.801880e+05               8.325599e-01 
##                    de_novo            post_crisis_ind 
##               0.000000e+00               0.000000e+00 
##             fin_crisis_ind 
##               0.000000e+00 

stargazer(not_mdi_vars, type = "html", title="Descriptive Statistics: Non-MDIs", digits=3, out="non_mdi_summary_statistics.htm", covariate.labels = c("% Change Amt. S. Bus. Loans", "% Change Num. S. Bus. Loans", "Tier 1 Leverage Ratio", "Small-Business Loans", "ROA", "NPA", "Total Assets", "Deposits", "De Novo", "Post Crisis", "Financial Crisis"))

apply(not_mdi_vars, 2, median)

##            totSBloans_Delt         totNumSBloans_Delt 
##               7.259599e-03              -5.277045e-03 
##        t1_LR_lagged_1_year   tot_SB_loans_TA_lagged_1 
##               9.729700e-02               5.149902e-02 
##               ROA_lagged_1            NPA_TA_lagged_1 
##               4.181979e-03               7.799764e-04 
## total_assets_lagged_1_year             TD_TA_lagged_1 
##               1.716860e+05               8.496946e-01 
##                    de_novo            post_crisis_ind 
##               0.000000e+00               0.000000e+00 
##             fin_crisis_ind 
##               0.000000e+00 

