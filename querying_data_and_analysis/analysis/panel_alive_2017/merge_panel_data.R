## read in data and merge-----

panel_total_equity <- readRDS("panel_total_equity.rds")
panel_total_assets <- readRDS("panel_total_assets.rds")

panel <- merge(panel_total_assets, panel_total_equity, by = c("quarter", "IDRSSD"), all = FALSE)

## commercial and industrial loans -----

panel_Cloans_cap <- readRDS("panel_Cloans_cap.rds")

panel <- merge(panel, panel_Cloans_cap, by = c("quarter", "IDRSSD"), all = FALSE)


##  -----

panel_loans_cap <- readRDS("panel_loans_cap.rds")

panel <- merge(panel, panel_loans_cap, by = c("quarter", "IDRSSD"), all = FALSE)

##  -----

panel_net_income <- readRDS("panel_net_income.rds")

panel <- merge(panel, panel_net_income, by = c("quarter", "IDRSSD"), all = FALSE)


##  -----

panel_risk_weighted_assets <- readRDS("panel_risk_weighted_assets.rds")

panel <- merge(panel, panel_risk_weighted_assets, by = c("quarter", "IDRSSD"), all = FALSE)


##  -----

panel_tier_1_cap <- readRDS("panel_tier_1_cap.rds")

panel <- merge(panel, panel_tier_1_cap, by = c("quarter", "IDRSSD"), all = FALSE)


##  -----

panel_total_interest_expense <- readRDS("panel_total_interest_expense.rds")

panel <- merge(panel, panel_total_interest_expense, by = c("quarter", "IDRSSD"), all = FALSE)


##  -----

panel_total_interest_income <- readRDS("panel_total_interest_income.rds")

panel <- merge(panel, panel_total_interest_income, by = c("quarter", "IDRSSD"), all = FALSE)


##  -----

panel_total_noninterest_expense <- readRDS("panel_total_noninterest_expense.rds")

panel <- merge(panel, panel_total_noninterest_expense, by = c("quarter", "IDRSSD"), all = FALSE)


##  -----

panel_total_noninterest_income <- readRDS("panel_total_noninterest_income.rds")

panel <- merge(panel, panel_total_noninterest_income, by = c("quarter", "IDRSSD"), all = FALSE)

##### Income statement ---------------

##  -----

panel_interest_income_1_4_residential_prop <- readRDS("panel_interest_income_1_4_residential_prop.rds")
panel_interest_income_1_4_residential_prop[] <- lapply(panel_interest_income_1_4_residential_prop, function(x) as.numeric(as.character(x)))

## remove col
panel <- subset(panel, select=-interest_income_1_4_residential_prop)

panel <- merge(panel, panel_interest_income_1_4_residential_prop, by = c("quarter", "IDRSSD"), all = FALSE)






## read in panel when not yet loaded
panel <- readRDS('panel.rds')


## turn all columns to numeric from factor 
panel[] <- lapply(panel, function(x) as.numeric(as.character(x)))
saveRDS(panel, "panel.rds")
