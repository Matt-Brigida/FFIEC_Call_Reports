library(here)

## sample of firms

idrssds <- readRDS("idrssds_alive_06302017.rds")

### Total Assets -------

source(paste0(here(), "/querying_data_and_analysis/item_queries/current_assets.R"))
source(paste0(here(), "/querying_data_and_analysis/item_queries/current_liabilities.R"))

current_assets <- new.env()

for (i in idrssds){

    tryCatch({
        assign("tmpta", query_current_assets(i))

        names(tmpta) <- paste0("ID_", i)

        assign(paste0("ID_", i),
               tmpta, envir = current_assets)
    },
    error=function(cond) {
        message("Error, and error message is:")
        message(cond)
                                        # Choose a return value in case of error
        return(NA)
    }
    )
}

all_current_assets <- do.call(merge, as.list(current_assets))

write.csv(all_current_assets, "current_assets.csv")
saveRDS(all_current_assets, "current_assets.rds")

### Current Liabilities ------

current_liabilities <- new.env()

for (i in idrssds){

    tryCatch({
    assign("tmpta", query_current_liabilities(i))

    names(tmpta) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpta, envir = current_liabilities)
        },
    error=function(cond) {
        message("Error, and error message is:")
        message(cond)
                                        # Choose a return value in case of error
        return(NA)
    }
    )
    }

all_current_liabilities <- do.call(merge, as.list(current_liabilities))

write.csv(all_current_liabilities, "current_liabilities.csv")
saveRDS(all_current_liabilities, "current_liabilities.rds")



