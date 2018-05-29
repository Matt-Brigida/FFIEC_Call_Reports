library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("./all_deaths.rds")
idrssds_alive <- readRDS("./idrssds_alive_06302017.rds")

idrssds <- c(idrssds_alive, idrssds_dead)

## number small business loans

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RI_query.R"))

total_interest_income <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4107"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = total_interest_income)

    }

all_total_interest_income <- do.call(merge, as.list(total_interest_income))

write.csv(all_total_interest_income, "total_interest_income.csv")
saveRDS(all_total_interest_income, "total_interest_income.rds")
