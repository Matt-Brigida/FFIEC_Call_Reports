## load libs

library(xts)

## read in panel when not yet loaded
## panel <- readRDS('panel.rds')

## read in data and merge-----

panel_total_equity_lagged_1_year <- readRDS("../panel_total_equity_lagged_1_year.rds")

panel_total_assets <- readRDS("./panel_total_assets.rds")

panel <- merge(panel_total_assets, panel_total_equity_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

### total assets lagged 1 year---

panel_total_assets_lagged_1_year <- readRDS("../panel_total_assets_lagged_1_year.rds")

panel <- merge(panel, panel_total_assets_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

## t1 leverage ratio (none past 2014)------

panel_t1_LR_lagged_1_year <- readRDS("../panel_t1_LR_lagged_1_year.rds")

panel <- merge(panel, panel_t1_LR_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

## t1 RBCR pre 2014------

panel_t1_RBCR_lagged_1_year <- readRDS("../panel_t1_RBCR_lagged_1_year.rds")

panel <- merge(panel, panel_t1_RBCR_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

### Amount of SB loans lagged 1 year
##

panel_amt_CI_less_100_SB_loans_lagged_1_year <- readRDS("../panel_amt_CI_less_100_SB_loans_lagged_1_year.rds")

panel <- merge(panel, panel_amt_CI_less_100_SB_loans_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_100_250_SB_loans_lagged_1_year <- readRDS("../panel_amt_CI_100_250_SB_loans_lagged_1_year.rds")

panel <- merge(panel, panel_amt_CI_100_250_SB_loans_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_250_1000_SB_loans_lagged_1_year <- readRDS("../panel_amt_CI_250_1000_SB_loans_lagged_1_year.rds")

panel <- merge(panel, panel_amt_CI_250_1000_SB_loans_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

### % change in SB loans 
##

panel_amt_CI_less_100_SB_loans_Delt_lagged_1_year <- readRDS("./panel_amt_CI_less_100_SB_loans_Delt_lagged_1_year.rds")

panel <- merge(panel, panel_amt_CI_less_100_SB_loans_Delt_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_100_250_SB_loans_Delt_lagged_1_year <- readRDS("./panel_amt_CI_100_250_SB_loans_Delt_lagged_1_year.rds")

panel <- merge(panel, panel_amt_CI_100_250_SB_loans_Delt_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_amt_CI_250_1000_SB_loans_Delt_lagged_1_year <- readRDS("./panel_amt_CI_250_1000_SB_loans_Delt_lagged_1_year.rds")

panel <- merge(panel, panel_amt_CI_250_1000_SB_loans_Delt_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_npa_30_89_lagged_1_year <- readRDS("../panel_npa_30_89_lagged_1_year.rds")

panel <- merge(panel, panel_npa_30_89_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)


##

panel_npa_90_plus_lagged_1_year <- readRDS("../panel_npa_90_plus_lagged_1_year.rds")

panel <- merge(panel, panel_npa_90_plus_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)


##

panel_npa_nonacc_lagged_1_year <- readRDS("../panel_npa_nonacc_lagged_1_year.rds")

panel <- merge(panel, panel_npa_nonacc_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_net_income <- readRDS("./panel_net_income.rds")

panel <- merge(panel, panel_net_income, by = c("quarter", "IDRSSD"), all = FALSE)

##

panel_total_deposits_lagged_1_year <- readRDS("../panel_domestic_deposits_lagged_1_year.rds")

panel <- merge(panel, panel_total_deposits_lagged_1_year, by = c("quarter", "IDRSSD"), all = FALSE)










##########################################
### Cleaning and arranging ###############
##########################################

### turn all columns to numeric from factor 
panel[] <- lapply(panel, function(x) as.numeric(as.character(x)))

## remove any Inf or NaNs in the change data
panel$amt_CI_less_100_SB_loans_Delt_lagged_1_year[is.infinite(panel$amt_CI_less_100_SB_loans_Delt_lagged_1_year)] <- NA
panel$amt_CI_less_100_SB_loans_Delt_lagged_1_year[is.nan(panel$amt_CI_less_100_SB_loans_Delt_lagged_1_year)] <- NA

panel$amt_CI_100_250_SB_loans_Delt_lagged_1_year[is.infinite(panel$amt_CI_100_250_SB_loans_Delt_lagged_1_year)] <- NA
panel$amt_CI_100_250_SB_loans_Delt_lagged_1_year[is.nan(panel$amt_CI_100_250_SB_loans_Delt_lagged_1_year)] <- NA

panel$amt_CI_250_1000_SB_loans_Delt_lagged_1_year[is.infinite(panel$amt_CI_250_1000_SB_loans_Delt_lagged_1_year)] <- NA
panel$amt_CI_250_1000_SB_loans_Delt_lagged_1_year[is.nan(panel$amt_CI_250_1000_SB_loans_Delt_lagged_1_year)] <- NA


### creating regression variables------

panel$tot_SB_loans_lagged_1_year <- panel$amt_CI_less_100_SB_loans_lagged_1_year + panel$amt_CI_100_250_SB_loans_lagged_1_year + panel$amt_CI_250_1000_SB_loans_lagged_1_year

panel$tot_lagged_SB_loans_TA <- panel$tot_SB_loans_lagged_1_year / panel$total_assets_lagged_1_year
panel$less_100_lagged_SB_loans_TA <- panel$amt_CI_less_100_SB_loans_lagged_1_year / panel$total_assets_lagged_1_year
panel$X100_250_lagged_SB_loans_TA <- panel$amt_CI_100_250_SB_loans_lagged_1_year / panel$total_assets_lagged_1_year
panel$X250_1000_lagged_SB_loans_TA <- panel$amt_CI_250_1000_SB_loans_lagged_1_year / panel$total_assets_lagged_1_year
panel$ROA <- panel$net_income / panel$total_assets
panel$tot_NPA <- panel$npa_30_89_lagged_1_year + panel$npa_90_plus_lagged_1_year + panel$npa_nonacc_lagged_1_year
panel$NPA_TA <- panel$tot_NPA / panel$total_assets_lagged_1_year
panel$TD_TA <- panel$domestic_deposits_lagged_1_year / panel$total_assets_lagged_1_year

### create time indicator variables

## post-crisis indicator for 2012 to 2015

panel$post_crisis_ind <- ifelse(panel$quarter %in% 45:60, 1, 0)

saveRDS(panel, "panel.rds")

### creating MDI insicators and subsets-------------

### preparing MDI data -----

mdi <- read.csv("../new_jim_mdi_dataset.csv", header = TRUE, stringsAsFactors = FALSE, na.strings=c(""," ","NA"))
mdi$CITY <- na.locf(mdi$CITY)
mdi$STATE <- na.locf(mdi$STATE)
mdi$MinorityStatusCode <- na.locf(mdi$MinorityStatusCode)
mdi$DATE <- as.Date(mdi$DATE, format = "%m/%d/%Y")
mdi$DATE <- as.numeric(gsub("-", "", mdi$DATE))

## remove all mdi data after 20140630  which is the last observation in Rebel dataset -----
## mdi <- mdi[mdi$DATE <= 20140630, ]

## now create the matching key-----date_idrssd

theindex <- paste0(mdi$DATE, "_", mdi$IDRSSD)

mdi <- cbind(theindex, mdi)

## split into race subsets-----

mdi_black <- subset(mdi, MinorityStatusCode == "B")
mdi_hispanic <- subset(mdi, MinorityStatusCode == "H")
mdi_asian <- subset(mdi, MinorityStatusCode == "A")
mdi_native <- subset(mdi, MinorityStatusCode == "N")
mdi_multi <- subset(mdi, MinorityStatusCode == "M")

### Create subsets--------

panel_non_mdi <- subset(panel, !(IDRSSD %in% mdi$IDRSSD))
panel_mdi <- subset(panel, (IDRSSD %in% mdi$IDRSSD))
panel_mdi_black <- subset(panel, (IDRSSD %in% mdi_black$IDRSSD))
panel_mdi_hispanic <- subset(panel, (IDRSSD %in% mdi_hispanic$IDRSSD))
panel_mdi_asian <- subset(panel, (IDRSSD %in% mdi_asian$IDRSSD))
panel_mdi_native <- subset(panel, (IDRSSD %in% mdi_native$IDRSSD))
panel_mdi_multi <- subset(panel, (IDRSSD %in% mdi_multi$IDRSSD))
panel_mdi_bhn <- rbind(panel_mdi_black, panel_mdi_hispanic, panel_mdi_native)


### create MDI indicator on full sample-----

mdi_ind <- 0
bhn_ind <- 0
hispanic_ind <- 0
asian_ind <- 0
black_ind <- 0
native_ind <- 0
multi_ind <- 0

## all mdi
for (i in 1:dim(panel)[1]){
    mdi_ind[i] <- ifelse(panel$IDRSSD[i] %in% panel_mdi$IDRSSD, 1, 0)
}

panel_mdi_ind <- cbind(panel, mdi_ind)

## asian mdi
for (i in 1:dim(panel)[1]){
    asian_ind[i] <- ifelse(panel$IDRSSD[i] %in% panel_mdi_asian$IDRSSD, 1, 0)
}

panel_mdi_ind <- cbind(panel_mdi_ind, asian_ind)

## non asian mdi
for (i in 1:dim(panel)[1]){
    bhn_ind[i] <- ifelse(panel$IDRSSD[i] %in% panel_mdi_bhn$IDRSSD, 1, 0)
}

panel_mdi_ind <- cbind(panel_mdi_ind, bhn_ind)

## black mdi
for (i in 1:dim(panel)[1]){
    black_ind[i] <- ifelse(panel$IDRSSD[i] %in% panel_mdi_black$IDRSSD, 1, 0)
}

panel_mdi_ind <- cbind(panel_mdi_ind, black_ind)

## hispanic mdi
for (i in 1:dim(panel)[1]){
    hispanic_ind[i] <- ifelse(panel$IDRSSD[i] %in% panel_mdi_hispanic$IDRSSD, 1, 0)
}

panel_mdi_ind <- cbind(panel_mdi_ind, hispanic_ind)



### add mdi type by name to all data------------------------------------------------

mdi_type <- ""

for (i in 1:dim(panel)[1]){
    mdi_type[i] <- if(panel$IDRSSD[i] %in% panel_mdi_asian$IDRSSD){
                       "MDI_Asian"
                   } else {
                       if(panel$IDRSSD[i] %in% panel_mdi_black$IDRSSD){
                           "MDI_African_American"
                       } else {
                           if(panel$IDRSSD[i] %in% panel_mdi_hispanic$IDRSSD){
                               "MDI_Hispanic"
                           } else {
                               if(panel$IDRSSD[i] %in% panel_mdi_native$IDRSSD){
                                   "MDI_Native_American"
                               } else {
                                   if(panel$IDRSSD[i] %in% panel_mdi_multi$IDRSSD){
                                       "MDI_Multi"
                                   } else {
                                       "Non-MDI"
                                   }
                               }
                           }
                       }
                   }
}


panel_mdi_type <- cbind(panel, mdi_type)
saveRDS(panel_mdi_type, "panel_mdi_type.rds")
saveRDS(panel_mdi_ind, "panel_mdi_ind.rds")
