## read in panel when not yet loaded
panel <- readRDS('panel.rds')

## read in data and merge-----

panel_total_equity_lagged_1_year <- readRDS("panel_total_equity_lagged_1_year.rds")

panel_total_assets_lagged_1_year <- readRDS("panel_total_assets_lagged_1_year.rds")

panel <- merge(panel_total_assets_lagged_1_year, panel_total_equity_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

## t1 leverage ratio (none past 2014)------

panel_t1_LR_pre_2014_lagged_1_year <- readRDS("./panel_t1_LR_pre_2014_lagged_1_year.rds")

panel <- merge(panel, panel_t1_LR_pre_2014_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

## t1 RBCR pre 2014------

panel_t1_RBCR_pre_2014_lagged_1_year <- readRDS("./panel_t1_RBCR_pre_2014_lagged_1_year.rds")

panel <- merge(panel, panel_t1_RBCR_pre_2014_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

### Amount of SB loans lagged 1 year
##

panel_amt_CI_less_100_SB_loans_lagged_1_year <- readRDS("./panel_amt_CI_less_100_SB_loans_lagged_1_year.rds")

panel <- merge(panel, panel_amt_CI_less_100_SB_loans_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_100_250_SB_loans_lagged_1_year <- readRDS("./panel_amt_CI_100_250_SB_loans_lagged_1_year.rds")

panel <- merge(panel, panel_amt_CI_100_250_SB_loans_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_250_1000_SB_loans_lagged_1_year <- readRDS("./panel_amt_CI_250_1000_SB_loans_lagged_1_year.rds")

panel <- merge(panel, panel_amt_CI_250_1000_SB_loans_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

### % change in SB loans 
##

panel_amt_CI_less_100_SB_loans_Delt <- readRDS("./panel_amt_CI_less_100_SB_loans_Delt.rds")

panel <- merge(panel, panel_amt_CI_less_100_SB_loans_Delt, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_100_250_SB_loans_Delt <- readRDS("./panel_amt_CI_100_250_SB_loans_Delt.rds")

panel <- merge(panel, panel_amt_CI_100_250_SB_loans_Delt, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_250_1000_SB_loans_Delt <- readRDS("./panel_amt_CI_250_1000_SB_loans_Delt.rds")

panel <- merge(panel, panel_amt_CI_250_1000_SB_loans_Delt, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_npa_30_89_lagged_1_year <- readRDS("./panel_npa_30_89_lagged_1_year.rds")

panel <- merge(panel, panel_npa_30_89_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)


##

panel_npa_90_plus_lagged_1_year <- readRDS("./panel_npa_90_plus_lagged_1_year.rds")

panel <- merge(panel, panel_npa_90_plus_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)


##

panel_npa_nonacc_lagged_1_year <- readRDS("./panel_npa_nonacc_lagged_1_year.rds")

panel <- merge(panel, panel_npa_nonacc_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_net_income_lagged_1_year <- readRDS("./panel_net_income_lagged_1_year.rds")

panel <- merge(panel, panel_net_income_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)


### turn all columns to numeric from factor 
panel[] <- lapply(panel, function(x) as.numeric(as.character(x)))

### creating regression variables------

panel$tot_SB_loans_lagged_1_year <- panel$amt_CI_less_100_SB_loans_lagged_1_year + panel$amt_CI_100_250_SB_loans_lagged_1_year + panel$amt_CI_250_1000_SB_loans_lagged_1_year

panel$tot_lagged_SB_loans_TA <- panel$tot_SB_loans_lagged_1_year / panel$total_assets_lagged_1_year
panel$less_100_lagged_SB_loans_TA <- panel$amt_CI_less_100_SB_loans_lagged_1_year / panel$total_assets_lagged_1_year
panel$X100_250_lagged_SB_loans_TA <- panel$amt_CI_100_250_SB_loans_lagged_1_year / panel$total_assets_lagged_1_year
panel$X250_1000_lagged_SB_loans_TA <- panel$amt_CI_250_1000_SB_loans_lagged_1_year / panel$total_assets_lagged_1_year
panel$ROA <- panel$net_income_lagged_1_year / panel$total_assets_lagged_1_year
panel$tot_NPA <- panel$npa_30_89_lagged_1_year + panel$npa_90_plus_lagged_1_year + panel$npa_nonacc_lagged_1_year
panel$NPA_TA <- panel$tot_NPA / panel$total_assets_lagged_1_year

saveRDS(panel, "panel.rds")
