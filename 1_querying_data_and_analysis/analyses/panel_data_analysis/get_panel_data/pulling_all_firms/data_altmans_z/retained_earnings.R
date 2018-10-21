library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead)


### Retained_earnings -------

source(paste0(here(), "/querying_data_and_analysis/item_queries/retained_earnings.R"))

retained_earnings <- new.env()

for (i in idrssds){

    tryCatch({
        assign("tmpta", query_retained_earnings(i))

        names(tmpta) <- paste0("ID_", i)

        assign(paste0("ID_", i),
               tmpta, envir = retained_earnings)
    },
    error=function(cond) {
        message("Error, and error message is:")
        message(cond)
                                        # Choose a return value in case of error
        return(NA)
    }
    )
}

all_retained_earnings <- do.call(merge, as.list(retained_earnings))

write.csv(all_retained_earnings, "retained_earnings.csv")
saveRDS(all_retained_earnings, "retained_earnings.rds")
