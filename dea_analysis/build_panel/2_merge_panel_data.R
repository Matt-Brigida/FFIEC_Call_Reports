## load libs

library(xts)

## read in full panel from previous analysis----

panel <- readRDS("../../1_querying_data_and_analysis/analyses/panel_data_analysis/full_panel/1_panel_with_full_quarter_date/1_one_panel_all_models/full_panel.rds")

## read in data and merge-----

panel_total_interest_expense <- readRDS("./panel_total_interest_expense.rds")

panel <- merge(panel, panel_total_interest_expense, by = c("quarter", "IDRSSD"), all = FALSE)

panel_domestic_deposits <- readRDS("./panel_domestic_deposits.rds")

panel <- merge(panel, panel_domestic_deposits, by = c("quarter", "IDRSSD"), all = FALSE)


##########################################
### Cleaning and arranging ###############
##########################################

### turn all columns to numeric from factor 
panel[] <- lapply(panel, function(x) as.numeric(as.character(x)))

## remove any Inf or NaNs in the change data
## panel$amt_CI_less_100_SB_loans_Delt[is.infinite(panel$amt_CI_less_100_SB_loans_Delt)] <- NA
## panel$amt_CI_less_100_SB_loans_Delt[is.nan(panel$amt_CI_less_100_SB_loans_Delt)] <- NA

## panel$amt_CI_100_250_SB_loans_Delt[is.infinite(panel$amt_CI_100_250_SB_loans_Delt)] <- NA
## panel$amt_CI_100_250_SB_loans_Delt[is.nan(panel$amt_CI_100_250_SB_loans_Delt)] <- NA

## panel$amt_CI_250_1000_SB_loans_Delt[is.infinite(panel$amt_CI_250_1000_SB_loans_Delt)] <- NA
## panel$amt_CI_250_1000_SB_loans_Delt[is.nan(panel$amt_CI_250_1000_SB_loans_Delt)] <- NA


### creating regression variables------

panel$cost_of_funds <- panel$total_interest_expense / panel$domestic_deposits
panel$cost_of_funds[is.infinite(panel$cost_of_funds)] <- NA

saveRDS(panel, "full_panel.rds")
