### tables of summary statistics

library(plm)
library(stargazer)

## pull MDI and non-MDI subsets-----------------

panel <- readRDS("../full_panel.rds")

## variables

var <- c("quarter", "totSBloans_Delt", "totNumSBloans_Delt", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind")

panel_vars <- data.frame(panel[, var])

panel_vars <- panel_vars[complete.cases(panel_vars), ]


de_novos <- subset(panel_vars, de_novo == 1)

not_de_novos <- subset(panel_vars, de_novo == 0)

## create tables with stargazer

stargazer(de_novos[, -1], type = "html", title="Descriptive Statistics: De Novo Banks", digits=3, out="de_novos_summary_statistics.htm", covariate.labels = c("% Change Amt. S. Bus. Loans", "% Change Num. S. Bus. Loans", "Tier 1 Leverage Ratio", "Small-Business Loans", "ROA", "NPA", "Total Assets", "Deposits", "De Novo", "Total Equity", "Post Crisis", "Financial Crisis"))

apply(de_novos, 2, median)

##                    quarter            totSBloans_Delt         totNumSBloans_Delt        t1_LR_lagged_1_year   tot_SB_loans_TA_lagged_1
##                 "20130930"            " 7.251564e+00"            "  0.744444444"                " 0.118100"             "2.797357e-01"
##               ROA_lagged_1            NPA_TA_lagged_1 total_assets_lagged_1_year             TD_TA_lagged_1                    de_novo
##            " 5.262449e-03"             "0.000000e+00"                "   135336"             "8.131726e-01"                        "1"
##         TETA_lagged_1_year            post_crisis_ind             fin_crisis_ind
##             " 0.121030250"                        "1"                        "0"

stargazer(not_de_novos[, -1], type = "html", title="Descriptive Statistics: Not De Novo Banks", digits=3, out="not_de_novos_summary_statistics.htm", covariate.labels = c("% Change Amt. S. Bus. Loans", "% Change Num. S. Bus. Loans", "Tier 1 Leverage Ratio", "Small-Business Loans", "ROA", "NPA", "Total Assets", "Deposits", "De Novo", "Total Equity", "Post Crisis", "Financial Crisis"))

apply(not_de_novos, 2, median)
