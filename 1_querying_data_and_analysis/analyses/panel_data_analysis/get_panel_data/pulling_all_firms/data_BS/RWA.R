### querying risk-weighted assets -------

## Schedule RCR
## RCONA223

## in 2017 RWA is now RCONG641
## in sch_RCRII_2_of_4_03312017.rds
library(xts)
library(here)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead)

### Pulling Noninterest Revenues by Source from Income Statement --------

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RCRII2_query.R"))

###  Risk-Weighted Assets -------

risk_weighted_assets <- new.env()

for (i in idrssds){
    
    assign("tmp", RCRII_2_of_X_query(i, code = "RCONG641"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = risk_weighted_assets)

    }

all_risk_weighted_assets <- do.call(merge, as.list(risk_weighted_assets))

write.csv(all_risk_weighted_assets, "risk_weighted_assets.csv")
saveRDS(all_risk_weighted_assets, "risk_weighted_assets.rds")

## see how many IDs have any data
sum(1*(apply(all_risk_weighted_assets, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
## 6414
