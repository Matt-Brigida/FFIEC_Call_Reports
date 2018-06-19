library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead)


### Balance Sheet----------------

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RC_query.R"))

### Total Assets -------

total_assets <- new.env()

for (i in idrssds){
    
    assign("tmpta", RC_query(i, code = "RCON2170"))

    names(tmpta) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpta, envir = total_assets)

    }

all_total_assets <- do.call(merge, as.list(total_assets))

write.csv(all_total_assets, "total_assets.csv")
saveRDS(all_total_assets, "total_assets.rds")

### Total Equity ------

total_equity <- new.env()

for (i in idrssds){
    
    assign("tmpta", RC_query(i, code = "RCON3210"))

    names(tmpta) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpta, envir = total_equity)

    }

all_total_equity <- do.call(merge, as.list(total_equity))

write.csv(all_total_equity, "total_equity.csv")
saveRDS(all_total_equity, "total_equity.rds")

### Domestic Deposits ------

domestic_deposits <- new.env()

for (i in idrssds){
## code for domestic deposits: RCON2200    
    assign("tmpta", RC_query(i, code = "RCON2200"))

    names(tmpta) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpta, envir = domestic_deposits)

    }

all_domestic_deposits <- do.call(merge, as.list(domestic_deposits))

write.csv(all_domestic_deposits, "domestic_deposits.csv")
saveRDS(all_domestic_deposits, "domestic_deposits.rds")

all_domestic_deposits_lagged_1_year <- lag(all_domestic_deposits, k = 4)
saveRDS(all_domestic_deposits_lagged_1_year, "domestic_deposits_lagged_1_year.rds")
