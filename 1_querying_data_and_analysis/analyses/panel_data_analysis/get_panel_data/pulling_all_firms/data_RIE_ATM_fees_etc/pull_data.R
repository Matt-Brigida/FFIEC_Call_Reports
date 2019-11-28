library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")
idrssds_births_since_12312017 <- readRDS("../idrssds_births_since_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead, idrssds_births_since_12312017)


### Schedule RIE----------------

source(paste0(here(), "/1_querying_data_and_analysis/individual_schedule_queries/schedule_RIE_query.R"))

### ATM Fees -------

## ATM fees returns *all NA*.

atm_fees <- new.env()

for (i in idrssds){
    
    assign("tmpta", RIE_query(i, code = "RIAD016"))

    names(tmpta) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpta, envir = atm_fees)

    }

all_atm_fees <- do.call(merge, as.list(atm_fees))

write.csv(all_atm_fees, "atm_fees.csv")
saveRDS(all_atm_fees, "atm_fees.rds")

