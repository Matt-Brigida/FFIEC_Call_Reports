## read in panel when not yet loaded
## panel <- readRDS('panel.rds')

## read in data and merge-----

panel_total_equity <- readRDS("panel_total_equity.rds")

panel_total_assets <- readRDS("panel_total_assets.rds")

panel <- merge(panel_total_assets, panel_total_equity, by = c("quarter", "IDRSSD"), all = FALSE)

## t1 leverage ratio (none past 2014)------

panel_t1_leverage_ratio_none_past_2014 <- readRDS("./panel_t1_leverage_ratio_none_past_2014.rds")

panel <- merge(panel, panel_t1_leverage_ratio_none_past_2014, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_less_100_SB_loans.rds <- readRDS("./panel_amt_CI_less_100_SB_loans.rds")

panel <- merge(panel, panel_amt_CI_less_100_SB_loans.rds, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_100_250_SB_loans <- readRDS("./panel_amt_CI_100_250_SB_loans.rds")

panel <- merge(panel, panel_amt_CI_100_250_SB_loans, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_250_1000_SB_loans <- readRDS("./panel_amt_CI_250_1000_SB_loans.rds")

panel <- merge(panel, panel_amt_CI_250_1000_SB_loans, by = c("quarter", "IDRSSD"), all = FALSE)

## turn all columns to numeric from factor 
panel[] <- lapply(panel, function(x) as.numeric(as.character(x)))
saveRDS(panel, "panel.rds")

### creating regression variables------

