library(here)

## sample of firms

idrssds <- readRDS("./all_deaths.rds")

### Total Assets -------

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RC_query.R"))

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



